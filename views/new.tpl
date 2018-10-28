% rebase('base.tpl', title="New - PyOil")

<div class="back row index">
<form action="/new" method="POST">
 <div class="form-group">
    <label for="price">Price</label>
    <input type="number" step="0.1" min="0" class="form-control" name="price" id="price"
           required="required" placeholder="Price">
 </div>
 <div class="form-group">
    <label for="litres">Litres</label>
    <input type="number" step="0.1" min="0" class="form-control" name="litres" id="litres"
           required="required" placeholder="Litres">
 </div>
 <div class="form-group">
    <label for="km">Km</label>
    <input type="number" step="0.1" min="0" class="form-control" name="km" id="km"
           required="required" placeholder="Km">
 </div>
 <div class="form-group">
    <button type="submit" class="btn btn-primary">Send</button>
 </div>
</form>
</div>
