% rebase('base.tpl', title="PyOil")
<div class="back row">
    <form class="form-inline">
        <select class="form-control"
                onchange="window.location.href = this.value">
        % for value, label, selected in options:
            <option value="{{ value }}" {{ selected }}>{{ label }}</option>
        % end
        </select>
        <span>&nbsp;</span>
        <a href="/new" class="btn btn-primary">New</a>
    </form>
    <table class="table">
        <tr>
            <th>Date</th>
            <th class="no-mobile">Price</th>
            <th>Litres</th>
            <th>Km</th>
            <th>Conso</th>
        </tr>
        % f2018/10/newor r in records:
            %if 'price' in r:
                <tr class="{{ r.get('css_class', 'none') }}">
                    <td><a href="/{{r['created'].replace('-', '/')}}"
                           >{{r['created']}}</a></td>
                    <td class="no-mobile">{{r['price']}}€</td>
                    <td>{{r['litres']}}l</td>
                    <td>{{r['km']}}km</td>
                    <td>{{r['conso']}}l<span class="no-mobile">/100km</span></td>
                </tr>
            % end
        % end
        <tr>
            <th>Total</th>
            <th class="no-mobile">{{total['price']}}€</th>
            <th>{{total['litres']}}l</th>
            <th>{{total['km']}}km</th>
            <th>{{total['conso']}}l<span class="no-mobile">/100km</span></th>
        </tr>
    </table>
</div>
