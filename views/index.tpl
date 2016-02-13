<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<title>PyOil</title>
</head>
<body>
<div class="container">

<div class="row">&nbsp;</div>

<div class="row">
<form action="." method="POST" class="form-inline">
 <div class="form-group">
    <label for="price">Price</label>
    <input type="number" class="form-control" name="price" id="price" placeholder="Price">
 </div>
 <div class="form-group">
    <label for="litres">Litres</label>
    <input type="number" class="form-control" name="litres" id="litres" placeholder="Litres">
 </div>
 <div class="form-group">
    <label for="km">Km</label>
    <input type="number" class="form-control" name="km" id="km" placeholder="Km">
 </div>
 <button type="submit" class="btn btn-primary">Send</button>
</form>
</div>

<div class="row">&nbsp;</div>

<div class="row">
    <table class="table">
        <tr>
            <th>Date</th>
            <th>Price</th>
            <th>Litres</th>
            <th>Km</th>
            <th>Conso</th>
        </tr>
        % for r in records:
            %if 'price' in r:
                <tr>
                    <td>{{r['date']}}</td>
                    <td>{{r['price']}}</td>
                    <td>{{r['litres']}}</td>
                    <td>{{r['km']}}</td>
                    <td>{{r['km'] / r['litres']}}</td>
                </tr>
            % end
        % end
    </table>
</div>

</div>
</body>
</html>
