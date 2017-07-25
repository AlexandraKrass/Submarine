Create or Replace Function tst.selling( query json ) returns json As $$
 
    Declare
        qb jsonb := query::jsonb;
        model varchar := cast( qb->>'mark' as varchar );
        sell json;
        total int;
    Begin
     
        --Select tst.selling('{"mark":"Королева"}');
        -- Insert Into tstт.selling ( mark, cost ) 
        Select sum(cost) From tst.realization into total;

        Select array_to_json( array_agg( t3 ) ) From (

          Select 

               name, sum(cost)
                
              From tst.realization t1 JOIN tst.mark t2 ON t1.boat=t2.id
                         
               GROUP BY name 
             
             ORDER BY sum ASC

        ) t3 Into sell;
      
        Return json_build_object('sell', sell, 'total', total);
        
    End;
    
$$ language plpgsql;