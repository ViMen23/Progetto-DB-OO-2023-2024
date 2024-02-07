/*
 * Copyright (c) 1995, 2008, Oracle and/or its affiliates. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *   - Neither the name of Oracle or the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


/*
 * GridBagLayoutDemo.java requires no other files.
 */

import java.awt.*;
import javax.swing.*;

public class Login extends JPanel {
	final static boolean shouldFill = true;
	final static boolean shouldWeightX = false;
	final static boolean RIGHT_TO_LEFT = false;

	JButton button, button2, button3;
	GridBagConstraints constraintButton = new GridBagConstraints();


	public Login()
	{

		setLayout(new GridBagLayout());

		constraintButton.fill = GridBagConstraints.NONE;
		constraintButton.weightx = 0;

		button = new JButton("5");
		constraintButton.gridx = 0;
		constraintButton.gridy = 0;
		add(button,constraintButton);
		setForeground(Color.black);

		//constraintButton = new GridBagConstraints();

		button2 = new JButton("4");

		constraintButton.gridx = 1;
		constraintButton.gridy = 0;
		add(button2,constraintButton);
		setForeground(Color.black);


		//constraintButton = new GridBagConstraints();

		button3 = new JButton("3");

		constraintButton.gridx = 2;
		constraintButton.gridy = 0;
		constraintButton.fill = GridBagConstraints.HORIZONTAL;
		add(button3,constraintButton);
		setForeground(Color.black);


		//setMinimumSize(new Dimension(100, 100));
		//setPreferredSize(new Dimension(100, 100));


		GridBagConstraints c = new GridBagConstraints();

		button = new JButton("Long-Named Button 4");
		c.fill = GridBagConstraints.HORIZONTAL;
		c.ipady = 40;      //make this component tall
		c.weightx = 0.5;
		c.gridwidth = 3;
		c.gridx = 0;
		c.gridy = 1;
		add(button, c);

		button = new JButton("5");
		c.fill = GridBagConstraints.HORIZONTAL;
		c.ipady = 0;       //reset to default
		c.weighty = 1.0;   //request any extra vertical space
		c.anchor = GridBagConstraints.PAGE_END; //bottom of space
		c.insets = new Insets(10,0,0,0);  //top padding
		c.gridx = 1;       //aligned with button 2
		c.gridwidth = 2;   //2 columns wide
		c.gridy = 2;       //third row
		add(button, c);


	}


}
