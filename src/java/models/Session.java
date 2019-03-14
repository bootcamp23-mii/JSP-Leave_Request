/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Panji Sadewo
 */
public class Session {
    private static String id;

    public Session() {
    }

    public static String getId() {
        return id;
    }

    public static void setId(String id) {
        Session.id = id;
    }
}
