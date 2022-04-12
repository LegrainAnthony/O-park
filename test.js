


/////////////////////////////////////////////////////

function dmh(ms){
    days = Math.floor(ms / (24*60*60*1000));
    daysms=ms % (24*60*60*1000);
    hours = Math.floor((daysms)/(60*60*1000));
    hoursms=ms % (60*60*1000);
    minutes = Math.floor((hoursms)/(60*1000));
    minutesms=ms % (60*1000);
    sec = Math.floor((minutesms)/(1000));
    return hours + ' : ' + minutes + ' : ' + sec + ' sec';
}


let timeTicket = Date.now();

function addTime () {
      return timeTicket += 300000;
};

let time; 

 setInterval(() => {
     addTime()
     time = dmh(timeTicket);
     console.log(time);
     console.log(timeTicket);
 }, 300000);

 let isvalide = true;


if (isvalide) {
    console.log('l\'attraction marche')
      query =  {
         text : `SELECT billet FROM visitor
         WHERE timestamp BETWEEN '${time}' AND ' ${time2}'
         `
      };
} else {
    console.log('l\'attraction est en panne')
    //ici créer sql 
//     CREATE OR REPLACE FUNCTION add_species(d json) RETURNS species AS $$

//     INSERT INTO bio.species
//     (scientific_name, common_name, family_id)
//     VALUES(
//         (d->>'scientific_name')::text,
//         (d->>'common_name')::text,
//         (d->>'family_id')::int
//     ) RETURNING *;

// $$ LANGUAGE sql;
}


 // Demain on doit récupérer la valeur "time" par un date.now et l'actualiser toutes les x minutes
 // et créer une "time2" qui récupère un date.now + x minutes 

 function trueFalse () {

     if (isvalide){
        isvalide = false
        console.log(isvalide);
     } 
     else {
         isvalide = true 
         console.log(isvalide);
     }
 }

 trueFalse()