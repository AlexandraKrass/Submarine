<page>

<div>
<H1>Добро пожаловать!</H1> 
<div class="form1">
<P> Здесь вы можете получить данные о покупателях подводных лодок фирмы
<br>   <h2>"Dream and Work!"</h2> </P> 				 
<input type="text" ref='name' id='name' placeholder="Введите марку субмарины" class="client1"  />
<p> 
<button ref="button" type="button" id='btn' class="btn" onclick={ get }>  Получить </button>
</p>

</div>
</div>

 <virtual each={ item in items}>
    <sample data={item} ></sample>
  </virtual>
<script>
	
	var tag = this
	tag.items = []
	
	var btn, inp;

	tag.on('mount', function(){
		
		btn = tag.refs.button
		inp = tag.refs.name
	
	})

	tag.get = function(){
		
		var name = inp.value // submarine type
		var url = '/submit'
	  	var data = { name : name }

	  	var onresponse = function( data ) {
	  		tag.items = data
	  		tag.update()
	  	}
	  	$.post( url, data ).done( onresponse )
	}

</script>


</page>