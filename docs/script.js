// Theme toggling
function toggleTheme() {
  const body = document.body;
  const current = body.getAttribute("data-theme") || "dark";
  const next = current === "dark" ? "light" : "dark";
  body.setAttribute("data-theme", next);
  localStorage.setItem("theme", next);
}

window.addEventListener("DOMContentLoaded", () => {
  const saved = localStorage.getItem("theme");
  document.body.setAttribute("data-theme", saved || "dark");

  // Typewriter effect
  const words = [
    "A project tracker.",
    "But elegant.",
    "Built for freelancers.",
    "Engineered for clarity.",
  ];
  let i = 0,
    j = 0,
    current = "",
    isDeleting = false,
    speed = 100;
  const typeTarget = document.getElementById("typewriter");

  function type() {
    if (!typeTarget) return;
    current = words[i];
    if (isDeleting) {
      typeTarget.innerHTML = current.substring(0, j--);
    } else {
      typeTarget.innerHTML = current.substring(0, j++);
    }

    if (!isDeleting && j === current.length + 1) {
      isDeleting = true;
      speed = 1000;
    } else if (isDeleting && j === 0) {
      isDeleting = false;
      i = (i + 1) % words.length;
      speed = 200;
    } else {
      speed = isDeleting ? 60 : 100;
    }
    setTimeout(type, speed);
  }

  type();

  // Fade-in scroll animations
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
