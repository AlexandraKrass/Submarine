<page>

<div>
<H1>Добро пожаловать!</H1> 
  <h2>"Dream and Work!"</h2> 
<div class="form1">
<P> Вы можете получить информацию о покупателях
<br> подводной лодки нашей фирмы</P> 			
<div class class="client1">	 
<input type="text" ref='name' id='name' placeholder="Введите марку субмарины" class="inp"  />
<button ref="button" type="button" id='btn' class="btn" onclick={ get }>  Узнать </button> </div>

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