package componentes;

import dao.ReservaDaoImp;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import dao.TratamientoDaoImp;
import java.util.Date;
/**
 *
 * @author Sergio
 */
public class Correo {

    private String usuarioCorreo;
    private String contrasena;

    public String getUsuarioCorreo() {
        return usuarioCorreo;
    }

    public void setUsuarioCorreo(String usuarioCorreo) {
        this.usuarioCorreo = usuarioCorreo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public static boolean EnviarCorreo(String nombre, String destinatario, String asunto, String mensaje) {
        Correo correo = new Correo();

        // El correo gmail de envío
        String correoEnvia = "sergio.guetta17@gmail.com";
        String claveCorreo = "ugxkekkwcoxxczrj";
        correo.setUsuarioCorreo(correoEnvia);
        correo.setContrasena(claveCorreo);

        // La configuración para enviar correo
        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.user", correo.getUsuarioCorreo());
        properties.put("mail.password", correo.getContrasena());
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // Obtener la sesion
        Session session = Session.getInstance(properties, null);
        int aviso = 0;
        try {
            // Crear el cuerpo del mensaje
            MimeMessage mimeMessage = new MimeMessage(session);

            // Agregar quien envía el correo
            mimeMessage.setFrom(new InternetAddress(correo.getUsuarioCorreo(), nombre));

            // Los destinatarios
            InternetAddress[] internetAddresses = {new InternetAddress(destinatario)};
//		     new InternetAddress("correo2@gmail.com"),
//		     new InternetAddress("correo3@gmail.com") };

            // Agregar los destinatarios al mensaje
            mimeMessage.setRecipients(Message.RecipientType.TO,
                    internetAddresses);

            // Agregar el asunto al correo
            mimeMessage.setSubject(asunto);

            // Creo la parte del mensaje
            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setText(mensaje);

//                    MimeBodyPart mimeBodyPartAdjunto = new MimeBodyPart();
//                    mimeBodyPartAdjunto.attachFile("C:/Users/Public/Pictures/Sample Pictures/Penguins.jpg");
            // Crear el multipart para agregar la parte del mensaje anterior
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(mimeBodyPart);
//                    multipart.addBodyPart(mimeBodyPartAdjunto);

            // Agregar el multipart al cuerpo del mensaje
            mimeMessage.setContent(multipart);

            // Enviar el mensaje
            Transport transport = session.getTransport("smtp");
            transport.connect(correo.getUsuarioCorreo(), correo.getContrasena());
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());

            transport.close();

            if (aviso == 0) {
                System.out.println("Correo enviado exitosamente ");
            }
        } catch (Exception ex) {
            System.out.println("Error al enviar correo " + ex.getMessage());
            ex.printStackTrace();
            aviso = 1;
            return false;

        }
        return true;
    }

    public static boolean EnviarRecordatorio(String correoPaciente) {

       Date fecha = ReservaDaoImp.traerFechaTermino();
        
       
        // El correo gmail de envío
        String correoEnvia = "sergio.guetta17@gmail.com";
        String claveCorreo = "ugxkekkwcoxxczrj";

        // La configuración para enviar correo
        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.user", correoEnvia);
        properties.put("mail.password", claveCorreo);
        properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        // Obtener la sesion
        Session session = Session.getInstance(properties, null);
        int aviso = 0;
        try {
            // Crear el cuerpo del mensaje
            MimeMessage mimeMessage = new MimeMessage(session);

            // Agregar quien envía el correo
            mimeMessage.setFrom(new InternetAddress(correoEnvia, "Cesfam quinta "));

            // Los destinatarios
            InternetAddress[] internetAddresses = {new InternetAddress("s.aravenag@alumnos.duoc.cl") ,new InternetAddress(correoPaciente)};
//		     new InternetAddress("correo2@gmail.com"),
//		     new InternetAddress("correo3@gmail.com") };

            // Agregar los destinatarios al mensaje
            mimeMessage.setRecipients(Message.RecipientType.TO,
                    internetAddresses);

            // Agregar el asunto al correo
            mimeMessage.setSubject("Recordatorio de expiracion de la fecha del retiro del medicamento");
 
            // Creo la parte del mensaje
            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setText("Debe dirigirse al cesfam a retirarse "
                    + " medicamento en la siguiente fecha : "+" Formato fecha : "+" (YYYY-MM-DD) "+ 
                   fecha.toString() + " Si no debera volver a hacer la consulta");

//                    MimeBodyPart mimeBodyPartAdjunto = new MimeBodyPart();
//                    mimeBodyPartAdjunto.attachFile("C:/Users/Public/Pictures/Sample Pictures/Penguins.jpg");
            // Crear el multipart para agregar la parte del mensaje anterior
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(mimeBodyPart);
//                    multipart.addBodyPart(mimeBodyPartAdjunto);

            // Agregar el multipart al cuerpo del mensaje
            mimeMessage.setContent(multipart);

            // Enviar el mensaje
            Transport transport = session.getTransport("smtp");
            transport.connect(correoEnvia, claveCorreo);
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());

            transport.close();

            if (aviso == 0) {
                System.out.println("Correo enviado exitosamente ");

            }
        } catch (Exception ex) {
            System.out.println("Error al enviar correo " + ex.getMessage());
            ex.printStackTrace();

            aviso = 1;

            return false;
        }
        return true;
    }

}
