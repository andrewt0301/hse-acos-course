(function () {
  const COMPACT_HEADER_BREAKPOINT = 1180;
  const root = document.documentElement;
  const body = document.body;
  const themeButtons = Array.from(document.querySelectorAll("[data-theme-option]"));
  const languageButtons = Array.from(document.querySelectorAll("[data-language-option]"));
  const languagePlaceholder = document.querySelector("[data-language-placeholder]");
  const languageReset = document.querySelector("[data-language-reset]");
  const navToggle = document.querySelector("[data-nav-toggle]");
  const navPanel = document.querySelector("[data-nav-panel]");
  const header = document.querySelector("[data-site-header]");
  const content = document.querySelector("[data-page-content]");
  const storageKeys = {
    theme: "acos-theme",
    language: "acos-language"
  };

  function persistPreference(key, value) {
    try {
      window.localStorage.setItem(key, value);
    } catch (error) {
      // Ignore storage failures in progressive enhancement.
    }
  }

  function getPreferredTheme() {
    try {
      const savedTheme = window.localStorage.getItem(storageKeys.theme);
      if (savedTheme === "light" || savedTheme === "dark") {
        return savedTheme;
      }
    } catch (error) {
      // Ignore storage failures in progressive enhancement.
    }

    if (root.dataset.theme === "light" || root.dataset.theme === "dark") {
      return root.dataset.theme;
    }

    return window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
  }

  function getPreferredLanguage() {
    try {
      const savedLanguage = window.localStorage.getItem(storageKeys.language);
      if (savedLanguage === "en" || savedLanguage === "ru") {
        return savedLanguage;
      }
    } catch (error) {
      // Ignore storage failures in progressive enhancement.
    }

    return root.dataset.language === "ru" ? "ru" : "en";
  }

  function syncPressedState(buttons, activeValue, attributeName) {
    buttons.forEach(function (button) {
      const isActive = button.getAttribute(attributeName) === activeValue;
      button.classList.toggle("is-active", isActive);
      button.setAttribute("aria-pressed", isActive ? "true" : "false");
    });
  }

  function applyTheme(theme) {
    const resolvedTheme = theme === "dark" ? "dark" : "light";
    root.dataset.theme = resolvedTheme;
    body.dataset.theme = resolvedTheme;
    syncPressedState(themeButtons, resolvedTheme, "data-theme-option");
  }

  function applyLanguage(language) {
    const resolvedLanguage = language === "ru" ? "ru" : "en";
    root.dataset.language = resolvedLanguage;
    root.lang = resolvedLanguage;
    body.dataset.language = resolvedLanguage;
    syncPressedState(languageButtons, resolvedLanguage, "data-language-option");

    if (languagePlaceholder) {
      languagePlaceholder.hidden = resolvedLanguage !== "ru";
    }
  }

  applyTheme(getPreferredTheme());
  applyLanguage(getPreferredLanguage());

  themeButtons.forEach(function (button) {
    button.addEventListener("click", function () {
      const selectedTheme = button.getAttribute("data-theme-option");
      persistPreference(storageKeys.theme, selectedTheme);
      applyTheme(selectedTheme);
    });
  });

  languageButtons.forEach(function (button) {
    button.addEventListener("click", function () {
      const selectedLanguage = button.getAttribute("data-language-option");
      persistPreference(storageKeys.language, selectedLanguage);
      applyLanguage(selectedLanguage);
    });
  });

  if (languageReset) {
    languageReset.addEventListener("click", function () {
      persistPreference(storageKeys.language, "en");
      applyLanguage("en");
    });
  }

  function closeNav() {
    if (!navToggle || !navPanel) {
      return;
    }

    body.classList.remove("nav-open");
    navToggle.setAttribute("aria-expanded", "false");
  }

  function openNav() {
    if (!navToggle || !navPanel) {
      return;
    }

    body.classList.add("nav-open");
    navToggle.setAttribute("aria-expanded", "true");
  }

  if (navToggle && navPanel) {
    navToggle.addEventListener("click", function () {
      if (body.classList.contains("nav-open")) {
        closeNav();
      } else {
        openNav();
      }
    });

    document.addEventListener("click", function (event) {
      if (!body.classList.contains("nav-open") || !header) {
        return;
      }

      if (!header.contains(event.target)) {
        closeNav();
      }
    });

    window.addEventListener("resize", function () {
      if (window.innerWidth > COMPACT_HEADER_BREAKPOINT) {
        closeNav();
      }
    });

    navPanel.addEventListener("click", function (event) {
      if (window.innerWidth > COMPACT_HEADER_BREAKPOINT) {
        return;
      }

      const target = event.target;
      if (target.matches("[data-nav-link]")) {
        closeNav();
      }
    });
  }

  document.querySelectorAll("[data-nav-link]").forEach(function (link) {
    try {
      const target = new URL(link.href, window.location.origin);
      const samePath = target.pathname === window.location.pathname;
      const isSectionRoot =
        target.hash &&
        window.location.pathname === new URL(target.origin + target.pathname).pathname;

      if (samePath || isSectionRoot) {
        link.classList.add("is-active");
      }
    } catch (error) {
      // Ignore malformed URLs in progressive enhancement.
    }
  });

  if (!content) {
    return;
  }

  const firstHeading = content.querySelector("h1");
  const breadcrumbCurrent = document.querySelector("[data-breadcrumb-current]");

  if (firstHeading && breadcrumbCurrent) {
    breadcrumbCurrent.textContent = firstHeading.textContent.trim();
  }

  enhanceCodeBlocks(content);
  buildToc(content);

  function slugify(text) {
    return text
      .toLowerCase()
      .normalize("NFKD")
      .replace(/[\u0300-\u036f]/g, "")
      .replace(/[^a-z0-9\s-]/g, "")
      .trim()
      .replace(/\s+/g, "-")
      .replace(/-+/g, "-");
  }

  function buildToc(scope) {
    const toc = document.querySelector("[data-toc]");
    const list = document.querySelector("[data-toc-list]");
    const usedIds = new Set();

    if (!toc || !list || body.dataset.pageKind === "home") {
      return;
    }

    const headings = Array.from(scope.querySelectorAll("h2, h3, h4")).filter(function (heading) {
      return heading.textContent.trim().length > 0;
    });

    if (headings.length < 2) {
      return;
    }

    headings.forEach(function (heading, index) {
      let headingId = heading.id;

      if (!headingId) {
        headingId = slugify(heading.textContent) || "section-" + (index + 1);
      }

      if (usedIds.has(headingId)) {
        let suffix = 2;
        while (usedIds.has(headingId + "-" + suffix)) {
          suffix += 1;
        }
        headingId = headingId + "-" + suffix;
      }

      usedIds.add(headingId);
      heading.id = headingId;

      const item = document.createElement("li");
      item.className = "toc-level-" + heading.tagName.toLowerCase();

      const link = document.createElement("a");
      link.href = "#" + heading.id;
      link.textContent = heading.textContent.trim();
      link.dataset.tocLink = heading.id;

      item.appendChild(link);
      list.appendChild(item);
    });

    toc.hidden = false;

    const links = Array.from(list.querySelectorAll("[data-toc-link]"));

    if ("IntersectionObserver" in window) {
      const observer = new IntersectionObserver(
        function (entries) {
          const visible = entries
            .filter(function (entry) {
              return entry.isIntersecting;
            })
            .sort(function (left, right) {
              return left.boundingClientRect.top - right.boundingClientRect.top;
            });

          if (!visible.length) {
            return;
          }

          const activeId = visible[0].target.id;
          links.forEach(function (link) {
            link.classList.toggle("is-active", link.dataset.tocLink === activeId);
          });
        },
        {
          rootMargin: "-25% 0px -60% 0px",
          threshold: [0, 1]
        }
      );

      headings.forEach(function (heading) {
        observer.observe(heading);
      });
    }
  }

  function enhanceCodeBlocks(scope) {
    const blocks = Array.from(scope.querySelectorAll("pre")).filter(function (pre) {
      return !pre.parentElement || !pre.parentElement.classList.contains("code-frame");
    });

    blocks.forEach(function (pre) {
      const code = pre.querySelector("code");
      const frame = document.createElement("div");
      frame.className = "code-frame";

      const toolbar = document.createElement("div");
      toolbar.className = "code-toolbar";

      const label = document.createElement("span");
      label.className = "code-label";

      const match = code && code.className.match(/language-([A-Za-z0-9_-]+)/);
      label.textContent = match ? match[1].toUpperCase() : "CODE";
      toolbar.appendChild(label);

      if (code && navigator.clipboard) {
        const button = document.createElement("button");
        button.type = "button";
        button.className = "code-copy";
        button.textContent = "Copy";
        button.addEventListener("click", function () {
          navigator.clipboard.writeText(code.innerText).then(function () {
            button.textContent = "Copied";
            window.setTimeout(function () {
              button.textContent = "Copy";
            }, 1600);
          });
        });
        toolbar.appendChild(button);
      }

      pre.parentNode.insertBefore(frame, pre);
      frame.appendChild(toolbar);
      frame.appendChild(pre);
    });
  }
})();
