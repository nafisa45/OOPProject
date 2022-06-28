package com.example.hotel;

import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public  class AboutUsController implements Initializable {

    public void handleAddAction(javafx.event.ActionEvent actionEvent) throws IOException {
        Stage add = new Stage();
        Parent root = FXMLLoader.load(getClass().getResource("aboutus.fxml"));
        Scene scene = new Scene(root);
        add.setScene(scene);
        add.show();
    }

    @Override
   public void initialize(URL url, ResourceBundle resourceBundle) {
    }
}
