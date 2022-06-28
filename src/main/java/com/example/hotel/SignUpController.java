package com.example.hotel;


import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class SignUpController implements Initializable {
    @FXML
    private TextField address;

    @FXML
    private RadioButton female;

    @FXML
    private RadioButton male;

    @FXML
    private TextField name;

    @FXML
    private TextField password;

    @FXML
    private Button signup;

    @FXML
    private TextField username;

    private Connection connection;

    private DBConnection dbConnection;

    private PreparedStatement pst;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        dbConnection = new DBConnection();
    }

    @FXML
    public void handleSignupAction(javafx.event.ActionEvent actionEvent) {
        String name_text = name.getText();
        String username_text = username.getText();
        String password_text = password.getText();
        String gender_text = getGender();
        String address_text = address.getText();

        assert name_text != null;
        assert username_text != null;
        assert password_text != null;
        assert gender_text != null;
        assert address_text != null;
        if (name_text.equals("") || username_text.equals("") || password_text.equals("") || gender_text.equals("") || address_text.equals("")) {
            OptionPane("Every Field is required", "Error Message");
        } else {
            String insert = "INSERT INTO users(name, username, password, gender, address)"
                    + "VALUES (?, ?, ?, ?, ?)";
            connection = dbConnection.getConnection();
            try {
                pst = connection.prepareStatement(insert);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                pst.setString(1, name_text);
                pst.setString(2, username_text);
                pst.setString(3, password_text);
                pst.setString(4, gender_text);
                pst.setString(5, address_text);
                pst.executeUpdate();
                OptionPane("Register Successfully", "Message");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @FXML
    public void handleLoginButton(javafx.event.ActionEvent actionEvent) throws IOException {
        signup.getScene().getWindow().hide();
        Stage login = new Stage();
        Parent root = FXMLLoader.load(getClass().getResource("login.fxml"));
        Scene scene = new Scene(root);
        login.setScene(scene);
        login.show();
    }

    public String getGender() {
        String gender = "";
        if (male.isSelected()) {
            gender = "Male";
        } else if (female.isSelected()) {
            gender = "Female";
        }
        return gender;
    }

    private void OptionPane(String message, String title) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.initStyle(StageStyle.UTILITY);
        alert.setTitle(title);
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }

}