Create or Replace Function tst.selling( query json ) returns json As $$
 
    Declare
        qb jsonb := query::jsonb;
        model varchar := cast( qb->>'mark' as varchar );
        deal int := cast( qb->>'cost' as int );
        data date := cast(qb->>'date' as date);
        sell json;
               
    Begin
    
        -- Insert Into tstт.selling ( mark, cost ) 

        Select array_to_json( array_agg( t3 ) ) From (

          Select 

               mark, cost, date
                
              From tst.realization t1 JOIN tst.boat t2 ON t1.boat=t2.id_boat
              
            WHERE mark = model ORDER BY date ASC

        ) t3 Into sell;
               
        Return sell;
        
    End;
    
$$ language plpgsql;