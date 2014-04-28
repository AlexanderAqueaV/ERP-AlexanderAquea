/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Helpers;

/**
 *
 * @author patricio
 */
public class MessageList {

    public static Message addMessage(String str) {

        /* instanciar la clase message */
        Message message = new Message();
        /* establecer mensaje */
        message.setMsg(str);

        return message;
    }
}
