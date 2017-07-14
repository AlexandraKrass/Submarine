Create or Replace Function tst.boat_sale( query json ) returns json As $$
 
    Declare
        qb jsonb := query::jsonb;
        cashing varchar := cast( qb->>'payment' as varchar );
        first_name varchar := cast( qb->>'full_name' as varchar );
        model varchar := cast( qb->>'mark' as varchar );
        cash json;
               
    Begin
    
        -- Insert Into tstт.boat_table ( payment, full_name, mark ) 

        Select array_to_json( array_agg( t4 ) ) From (

          Select 

               full_name
                
              From tst.clients t1 JOIN tst.realization t2 ON t1.id_client=t2.client 
              			  JOIN tst.boat t3  ON t2.boat=t3.id_boat
              
            WHERE payment = 'Наличные' AND mark = model 
                  ORDER BY full_name ASC

        ) t4 Into cash;
               
        Return cash;
        
    End;
    
$$ language plpgsql;