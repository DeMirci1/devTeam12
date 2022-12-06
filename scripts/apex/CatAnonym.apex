cat sfcat = new cat();
sfcat.name = 'Mercan';
sfcat.color = 'White';
system.debug('Child cat is ' + sfcat);

cat falconsCat = new cat ('Luna', 'Black');
system.debug('Father cat is ' + falconsCat);

cat falconsCat1 = new cat ('Cloudy', 'Brown');
system.debug('Mother cat is ' + falconsCat1);

system.debug('Number of cats ==>> ' + cat.countCat);