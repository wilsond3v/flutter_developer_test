# Mobile Developer Technical Test

Esta prueba de **Flutter** consta de 4 casos de prueba para que el candidato complete en no más de
veinticuatro (24) horas.

Las herramientas a utilizar son Flutter 2+ para el desarrollo de aplicaciones y cualquier backend
herramienta que el candidato quiere usar. Los tres (3) casos de prueba deben entregarse como un solo
aplicación trabajando juntos. La aplicación debe usar un diseño de pestañas.

# Caso de prueba 1:

El candidato necesita crear un sistema de autenticación usando Flutter 2+ y el backend de su elección.

**Estos son los criterios de aceptación:**

- La primera página de la aplicación debe ser la página de inicio de sesión y debe tener:
    - Una entrada de tipo de correo electrónico para la dirección de correo electrónico del usuario.
    - Una entrada de tipo de contraseña para la contraseña del usuario.
    - Un botón de "Iniciar sesión".
    - Un botón para ir a una página de registro para crear la cuenta.
    - Al iniciar sesión correctamente, la aplicación debe redirigir al usuario a un diseño de pestañas.
    - En caso de error, debe mostrar el error al usuario en una alerta.

- La página de registro debe tener:
    - Una entrada de tipo de correo electrónico para la dirección de correo electrónico del usuario.
    - Una entrada de tipo de contraseña para la contraseña del usuario (dos veces para la validación)
    - Un botón "Crear cuenta".
    - En la creación exitosa de la cuenta, el usuario debe ser redirigido al diseño de pestañas.
    - En caso de error, debe mostrar el error al usuario como una alerta.

- Los candidatos pueden usar cualquier servicio de backend que deseen para la autenticación de servicios. (es decir, Firebase, Auth0, etc.).

> **NOTA**: Los casos de prueba segundo, tercero y cuarto deben estar detrás del muro de autenticación y consisten en un diseño con pestañas con dos (2) pestañas, la primera pestaña se usará para el caso de prueba #2 y la segunda La pestaña se utilizará para los casos de prueba n.° 3 y n.° 4.

## Caso de prueba 2:

El candidato debe usar el complemento de cámara de Ionic native para tomar una foto y mostrarla en
la pantalla [Complemento](https://ionicframework.com/docs/native/camera/).

**Los criterios de aceptación son:**

- El usuario debe iniciar sesión para poder acceder al diseño con pestañas. 
- La página debe tener un botón que diga "Tomar una foto" que abra la cámara del teléfono y permite al usuario tomar una foto.
- El candidato puede decidir almacenar la imagen en el teléfono o descartarla. 
- Debajo de "Tomar una imagen" debe haber un texto que diga "No se tomó ninguna imagen" y ese texto debe ser reemplazado con la imagen una vez tomada la imagen.

## Caso de prueba 3:

El caso de prueba #3 consta de una página de lista que vivirá en la segunda pestaña. El candidato debe obtener datos de esta [URL](https://jsonplaceholder.typicode.com/posts/) y mostrar esos datos como una lista que solo muestra la propiedad TITLE. (El título debe estar en mayúsculas).

**Los criterios de aceptación son:**

- El candidato debe obtener la información del [URL](https://jsonplaceholder.typicode.com/posts/)
- La información debe mostrarse como una lista donde los usuarios pueden hacer clic en los elementos. 
- El elemento de la lista solo debe tener el título de propiedad y debe estar en mayúsculas.

## Caso de prueba 4 (OPCIONAL):

El Caso de Prueba #4 es opcional, y usa la lista creada en el Caso de Prueba #3, la idea es para el candidato para crear una página de detalles para el elemento en el que el usuario hace clic en la lista anterior y debería mostrar todas las propiedades del objeto. Demasiado detalle se puede utilizar este [formato](https://jsonplaceholder.typicode.com/posts/1)

**Los criterios de aceptación son:**

- Cuando alguien hace clic en un elemento de la lista, la aplicación debe redirigir a una página de detalles para ese elemento. 
- Dentro de la página de detalles, deberíamos poder ver todas las propiedades del elemento de la lista en el que se hizo clic. 

## Formato de solución

- La solución debe incluir el enlace del repositorio (GitHub o Bitbucket) y el archivo .apk adjunto.
- Se pueden registrar comentarios adicionales en el archivo README.md