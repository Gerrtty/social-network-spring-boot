<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
    <title>Spring Boot ajax example</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <link rel="stylesheet" type="text/css"
          href="webjars/bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>

<nav class="navbar navbar-inverse">
</nav>

<div class="container" style="min-height: 500px">

    <div class="starter-template">
        <h1>Search users</h1>

        <div id="feedback"></div>

        <form class="form-horizontal" id="search-form">
            <div class="form-group form-group-lg">
                <label class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" id="bth-search"
                            class="btn btn-primary btn-lg">Search
                    </button>
                </div>
            </div>
        </form>

    </div>

</div>

<script type="text/javascript"
        src="webjars/jquery/2.2.4/jquery.min.js"></script>

<script>

    $(document).ready(function () {

        $("#search-form").submit(function (event) {

            //stop submit the form, we will post it manually.
            event.preventDefault();

            fire_ajax_submit();

        });

    });

    function fire_ajax_submit() {

        var search = {};
        search["username"] = $("#username").val();

        $("#btn-search").prop("disabled", true);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/api/search",
            data: JSON.stringify(search),
            dataType: 'json',
            cache: false,
            timeout: 600000,
            success: function (data) {

                var json = "<h4>Ajax Response</h4>&lt;pre&gt;"
                    + JSON.stringify(data, null, 4) + "&lt;/pre&gt;";
                $('#feedback').html(json);

                console.log("SUCCESS : ", data);
                $("#btn-search").prop("disabled", false);

            },
            error: function (e) {

                var json = "<h4>Ajax Response</h4>&lt;pre&gt;"
                    + e.responseText + "&lt;/pre&gt;";
                $('#feedback').html(json);

                console.log("ERROR : ", e);
                $("#btn-search").prop("disabled", false);

            }
        });

    }

</script>

</body>
</html>