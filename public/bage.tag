<bage>

<div class="form2">
<P> Данные о сделки данной марки </P> 				 
<p> 
<button ref="button" type="button" id='btn' class="btn" onclick={ list }>  Получить </button>
</p>
  <style>
   table {
    table-layout: fixed; /* Фиксированная ширина ячеек */
    width: 100%; /* Ширина таблицы */
   }
   .col1 { width: 160px; }
   .coln { width: 60px; }
  </style>
</div>

 <virtual each={ item in items}>
    <list data={item} ></list>
  </virtual>

<p> <label>Total:</label> { total }</p>

<script>
	
	var tag = this
	tag.total = ""
	tag.items = []
	
	var btn;

	tag.on('mount', function(){
		
		btn = tag.refs.button
	
	})

	tag.list = function(){
		
		var url = '/calculation'
	  	var data = { name : name }
/// { sell:[], total: 3}
	  	var onresponse = function( data ) {
	  		tag.items = data.sell
	  		tag.total = data.total
	  		tag.update()
	  	}
	  	$.post( url, data ).done( onresponse )
	}

</script>


</bage>