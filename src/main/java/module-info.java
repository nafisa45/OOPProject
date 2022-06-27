module com.example.hotel {
    requires javafx.controls;
    requires javafx.fxml;
    requires itextpdf;
    requires java.sql;
    requires mysql.connector.java;
    requires java.datatransfer;
    requires java.desktop;


    opens com.example.hotel to javafx.fxml;
    exports com.example.hotel;
}