// Toggle between light and dark themes
function toggleTheme() {
  const body = document.body;
  const current = body.getAttribute("data-theme") || "dark";
  const next = current === "dark" ? "light" : "dark";
  body.setAttribute("data-theme", next);
  localStorage.setItem("theme", next);
}

window.addEventListener("DOMContentLoaded", () => {
  // Force dark theme as default
  const saved = localStorage.getItem("theme") || "dark";
  document.body.setAttribute("data-theme", saved);

  // ⌨️ Typewriter effect
  const phrases = [
    "A project tracker.",
    "But elegant.",
    "Built for freelancers.",
    "Engineered for clarity.",
  ];
  const typeTarget = document.getElementById("typewriter");
  let i = 0,
    j = 0,
    isDeleting = false;

  function type() {
    const current = phrases[i];
    if (isDeleting) {
      j--;
    } else {
      j++;
    }

    typeTarget.textContent = current.substring(0, j);

    let speed = isDeleting ? 50 : 100;

    if (!isDeleting && j === current.length + 1) {
      isDeleting = true;
      speed = 800;
    } else if (isDeleting && j === 0) {
      isDeleting = false;
      i = (i + 1) % phrases.length;
      speed = 300;
    }

    setTimeout(type, speed);
  }

  if (typeTarget) {
    setTimeout(type, 300); // slight delay so layout is stable
  }

  // 👀 Scroll fade-ins
  const fadeElems = document.querySelectorAll(".fade-scroll");
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("visible");
        }
      });
    },
    { threshold: 0.1 }
  );

  fadeElems.forEach((el) => observer.observe(el));
});
