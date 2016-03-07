<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

% if request.GET.get('form'):
<div class="row">&nbsp;</div>

<div class="row">
<form action="." method="POST" class="form-inline">
 <div class="form-group">
    <label for="price">Price</label>
    <input type="number" step="0.1" min="0" class="form-control" name="price" id="price" required="required" placeholder="Price">
 </div>
 <div class="form-group">
    <label for="litres">Litres</label>
    <input type="number" step="0.1" min="0" class="form-control" name="litres" id="litres" required="required" placeholder="Litres">
 </div>
 <div class="form-group">
    <label for="km">Km</label>
    <input type="number" step="0.1" min="0" class="form-control" name="km" id="km" required="required" placeholder="Km">
 </div>
 <button type="submit" class="btn btn-primary">Send</button>
</form>
</div>

% end

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
                    <td>{{r['created']}}</td>
                    <td>{{r['price']}}€</td>
                    <td>{{r['litres']}}l</td>
                    <td>{{r['km']}}km</td>
                    <td>{{r['conso']}}l/100km</td>
                </tr>
            % end
        % end
        <tr>
            <th>Total</th>
            <th>{{total['price']}}€</th>
            <th>{{total['litres']}}l</th>
            <th>{{total['km']}}km</th>
            <th>{{total['conso']}}l/100km</th>
        </tr>
    </table>
</div>

</div>
</body>
</html>
