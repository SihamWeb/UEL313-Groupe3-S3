document.addEventListener('DOMContentLoaded', function () {
    var paginationContainer = document.getElementById('pagination-container');
    var currentPage = parseInt(paginationContainer.getAttribute('data-current-page'), 10);
    var totalPages = parseInt(paginationContainer.getAttribute('data-total-pages'), 10);

    $('.pagination .page-link').on('click', function (e) {
        e.preventDefault();
        var page = parseInt($(this).data('page'), 10);
        if (page !== currentPage) {
            currentPage = page;
            loadPage(page);
        }
    });

    function loadPage(page) {
        $.ajax({
            url: '{{ path("tag", { "id": tag.id }) }}',
            type: 'GET',
            data: { page: page },
            success: function (data) {
                $('#results-container').html(data.html);
                $('#pagination-container').html(data.pagination);
                console.log(data.html);
            },
            error: function () {
                console.error('Error loading page ' + page);
            }
        });
    }
});
