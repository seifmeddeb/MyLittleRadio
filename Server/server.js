const express = require('express');
const app = express();
const path = require('path');
const port = 3000;

// Chemin du fichier JSON
const stationsFilePath = path.join(__dirname, 'stations.json');

// Route pour servir le fichier JSON
app.get('/stations', (req, res) => {
    res.sendFile(stationsFilePath);
});

// Démarrer le serveur
app.listen(port, () => {
    console.log(`Serveur Express en cours d'exécution sur http://localhost:${port}`);
});