% rebase('base.tpl', title="PyOil")
<div class="back row">
    <table class="table">
        <tr>
            <th>Date</th>
            <th class="no-mobile">Price</th>
            <th>Litres</th>
            <th>Km</th>
            <th>Conso</th>
        </tr>
        % for r in records:
            %if 'price' in r:
                <tr>
                    <td>{{r['created']}}</td>
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
