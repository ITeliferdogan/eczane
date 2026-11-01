document.querySelectorAll("nav a").forEach(function (link) {
    var currentPage = window.location.pathname.split("/").pop();
    var linkPage = link.getAttribute("href").split("/").pop();

    if (currentPage && linkPage === currentPage) {
        link.setAttribute("aria-current", "page");
    }
});
