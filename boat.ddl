Create or Replace Function tst.boat_sale( query json ) returns json As $$
 
    Declare
        qb jsonb := query::jsonb;
        cashing text := cast( qb->>'payment' as text );
        first_name text := cast( qb->>'full_name' as text );
        model text := cast( qb->>'name' as text );
        cash json;
               
    Begin
    
        -- Insert Into tstт.boat_table ( payment, full_name, mark ) 
        Select array_to_json( array_agg( t4 ) ) From (

          Select 

               full_name
                
              From tst.clients t1 JOIN tst.realization t2 ON t1.id=t2.client 
                      JOIN tst.mark t3  ON t2.boat=t3.id
             
            WHERE payment = 'Наличные' AND name = model 
                  ORDER BY full_name ASC

        ) t4 Into cash;
               
        Return cash;
        
    End;
    
$$ language plpgsql;