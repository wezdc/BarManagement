package validaciones;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class EmptyValidation implements KeyListener{

	@Override
	public void keyPressed(KeyEvent arg0) {

	}

	@Override
	public void keyReleased(KeyEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void keyTyped(KeyEvent arg0) {
		char codigo=arg0.getKeyChar();
		System.out.println(arg0.getKeyChar()+" \t");
		if(!Character.isLetter(codigo)){
			arg0.consume();
		}
	}
}
