const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();

// Configuración de bodyParser para procesar las solicitudes con formato JSON
app.use(bodyParser.json());

// Conexión a la base de datos de MongoDB
mongoose.connect('mongodb+srv://ykys1xd:Conan3123@cluster0.gtlzrgp.mongodb.net/?retryWrites=true&w=majority', { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Conexión a la base de datos establecida');
  })
  .catch((error) => {
    console.log('Error al conectar a la base de datos:', error);
  });

// Definición del esquema de la colección 'personas'
const personaSchema = new mongoose.Schema({
  nombre: String,
  apellido: String,
  edad: Number,
});

// Definición del modelo 'Persona' a partir del esquema
const Persona = mongoose.model('Persona', personaSchema);

// Ruta para crear una nueva persona
app.post('/api/personas', (req, res) => {
  const nuevaPersona = new Persona({
    nombre: req.body.nombre,
    apellido: req.body.apellido,
    edad: req.body.edad,
  });

  nuevaPersona.save()
    .then((resultado) => {
      console.log(resultado);
      res.json(resultado);
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Error al guardar la persona en la base de datos' });
    });
});

// Ruta para obtener todas las personas
app.get('/api/personas', (req, res) => {
  Persona.find()
    .then((personas) => {
      console.log(personas);
      res.json(personas);
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Error al obtener las personas de la base de datos' });
    });
});

// Ruta para obtener una persona por ID
app.get('/api/personas/:id', (req, res) => {
  Persona.findById(req.params.id)
    .then((persona) => {
      console.log(persona);
      res.json(persona);
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Error al obtener la persona de la base de datos' });
    });
});

// Ruta para actualizar una persona por ID
app.patch('/api/personas/:id', (req, res) => {
  Persona.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((persona) => {
      console.log(persona);
      res.json(persona);
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Error al actualizar la persona en la base de datos' });
    });
});

// Ruta para eliminar una persona por ID
app.delete('/api/personas/:id', (req, res) => {
  Persona.findByIdAndRemove(req.params.id)
    .then((persona) => {
      console.log(persona);
      res.json(persona);
    })
    .catch((error) => {
      console.log(error);
      res.status(500).json({ error: 'Error al eliminar la persona de la base de datos' });
    });
});

// Inicio del servidor
app.listen(3000, () => {
  console.log('Servidor iniciado en el puerto 3000')
});
