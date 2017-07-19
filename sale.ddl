Create or Replace Function tst.selling( query json ) returns json As $$
 
    Declare
        qb jsonb := query::jsonb;
        model varchar := cast( qb->>'mark' as varchar );
        sell json;
        total int;
    Begin
    
        -- Insert Into tstт.selling ( mark, cost ) 
        Select sum(cost) From tst.realization t4 JOIN tst.boat t5 ON t4.boat=t5.id_boat into total WHERE mark = model ;

        Select array_to_json( array_agg( t3 ) ) From (

          Select 

               mark, cost, date
                
              From tst.realization t1 JOIN tst.boat t2 ON t1.boat=t2.id_boat
              
            WHERE mark = model ORDER BY date ASC

        ) t3 Into sell;
      
        Return json_build_object('sell', sell, 'total', total);
        
    End;
    
$$ language plpgsql;