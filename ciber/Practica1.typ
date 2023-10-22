#import "template.typ": *

#show: project.with(
  title: "Práctica 1",
  materia: "Cibserseguridad",
  authors: (
    (name: "Osornio López Daniel Alejandro", email: "0244685@up.edu.mx"),
  ),
  date: "Ago 21, 2023",
)

#set rect(radius: 2pt) 

Hoy en día estoy muy interesado en el desarrollo de software, por lo que me centraría más en el desarrollo de software seguro, auditoría, asi como tal vez, diseño de arquitecturas seguras y escalables.

= SSCP

#rect(width: 100%)[
*Nombre*: Systems Security Certified Practitioner\
*Url*: https://www.isc2.org/Certifications/SSCP\
*Precio*: \$249 USD
]

El SSCP, que figura las siglas de _Systems Security Certified Practitioner_ es un certificado multi-disciplinario que cubre temas tanto de desarrollo de software, operaciones de seguridad, gestion y perimetros de seguridad. El certificado requiere de un año previo de experiencia en uno o más de los dominios que $"ISC"^2$

El examen cuenta con 125 preguntas que se deben responder en un tiempo máximo de 150 minutos, tiene un costo de 249 dólares americanos. La certificación SSCP demuestra que posee las habilidades técnicas y los conocimientos avanzados para implementar, supervisar y administrar la infraestructura de TI utilizando las mejores prácticas, políticas y procedimientos de seguridad establecidos por los expertos en ciberseguridad de ISC2. @sscp



= CSST

#rect(width: 100%)[
*Nombre*: Certified Software Security Tester\
*Url*: https://gaqm.org/certifications/software_security_testing/csst\
*Precio*: \$250 USD
]

El CSST, el cual cuenta con un e-curso que tiene una duración de 15 a 20 horas donde se enseña sobre lo que hay que saber para tener un conocimiento básico para realizar pruebas de seguridad sobre software.

Esta certificación es más un punto de entrada para administradores de sistemas y desarrolladores para que expandan su conocimiento sobre las pruebas de seguridad que permitan endurecer los sistemas que se administran. 

Para poder hacer el examen es necesario pasar el curso online pues la alberca de preguntas del examen provienen exclusivamente de los contenidos del curso, el examen junto con el curso cuesta 250 dólares, cuenta con 40 preguntas y se debe responder el 70% correctamente para poder aprobar.

= CSSLP

#rect(width: 100%)[
*Nombre*: Certified Secure Software Lifecycle Professional\
*Url*: https://www.isc2.org/Certifications/CSSLP\
*Precio*: \$599 USD
]

Esta certificación cuenta con varios objetivos por lograr para terminal, el primer curso es el _Secure Programming Foundation course_ (S-SPF), una introducción práctica al desarrollo de software seguro, demuestra que conoce los errores de programación que pueden provocar  vulnerabilidades de software, cómo estos errores son explotados por atacantes, y cómo puede prevenir fallos de software que permiten ciberataques @spf.

Es un curso dirigido a desarrolladores de software que se quieren meter al mundo de la seguridad para poder realizar programas más seguros, asi como tener en cuenta los aspectos importantes de seguridad al momento de pensar en el aplicativo.

= CAMS

#rect(width: 100%)[
*Nombre*: Certified Access Management Specialist\
*Url*: https://identitymanagementinstitute.org/cams/\
*Precio*: \$195 USD
]

La gestión de accesos es una de las disciplinas de la seguridad de la información que más interactúa con los usuarios y su gestión, y es fundamental para la aplicación de políticas y procedimientos que respalden los objetivos de seguridad de la organización, mitiguen los riesgos de acceso, mantengan los controles de acceso y cumplan los requisitos contractuales y legales. @cams

Este certificado se basa en entrenar al que lo toma en conceptos como identificación de amenazas, delimitar objetivos de seguridad, entender los controles de acceso, hacer el manejo corecto de _derechos_, entender la autorización, identificación y autenticación, asi como saber monitorear accesos y eventos.

Sin duda es un buen certificado que tomar para realizar actividades que requieren del manejo de permisos en una organización para proteger la integridad de los sistemas, aplicativos e información de la mejor manera posible. 

= DCA

#rect(width: 100%)[
*Nombre*: Docker Certification\
*Url*: https://training.mirantis.com/certification/dca-certification-exam/\
*Precio*: \$195 USD
]

Otro punto importante a dominar para poder trabajar, probablemente, en lo que ahora más me apasiona es tener dominado el concepto de _containers_.Esta dirigido para validar a individuos que tengan de entre 6 meses a 1 año de experiencia con docker. El examen consta de 55 preguntas, 13 que son de opcion múltiple que se debe responder en 90 minutos. 

De entre los demás certificados este también puede considerarse de entrada, y se dedica a un tema muy especifico que es la administración, creación, configuración, etc. El examen se realiza en linea, y el certificado solo es valido por 2 años.

#bibliography("bib.yml")
