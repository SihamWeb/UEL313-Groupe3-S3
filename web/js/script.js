$(document).ready(function () {
    // Function to load content
    function loadContent(page, containerId, paginationId, currentPageClass, contentType) {
        var url = $('#' + containerId).data('url');
        console.log('Avant requête AJAX');
        $.ajax({
            url: url,
            method: 'GET',
            data: {page: page, contentType: contentType},
            success: function (data, textStatus, xhr) {
                console.log('Response:', xhr.responseText);

                // Check if the 'content' array exists and is not empty
                if (Array.isArray(data.content) && data.content.length > 0) {
                    console.log(data.content);
                    $('#' + containerId).empty();

                    // Append each item in the array to the container
                    data.content.forEach(function (item) {
                        $('#' + containerId).append(item);
                    });

                    // Update the 'active' class for pagination
                    $('#' + paginationId + ' a').removeClass(currentPageClass);
                    $('#' + paginationId + ' a[data-page="' + page + '"]').addClass(currentPageClass);
                } else {
                    console.log('Content vide ou mal défini');
                }
            },
            error: function (xhr, status, error) {
                console.error('Erreur chargement content. Status:', status, 'Error:', error);
                console.log('Response Text:', xhr.responseText);
            }
        });
        console.log('Après requête AJAX');
    }

    // Manage links pagination
    $('#pagination-links').on('click', 'a', function (e) {
        e.preventDefault();
        var page = $(this).data('page');
        loadContent(page, 'links-container', 'pagination-links', 'active', 'links');
    });

    // Manage users pagination
    $('#pagination-users').on('click', 'a', function (e) {
        e.preventDefault();
        var page = $(this).data('page');
        loadContent(page, 'users-container', 'pagination-users', 'active', 'users');
    });
});

