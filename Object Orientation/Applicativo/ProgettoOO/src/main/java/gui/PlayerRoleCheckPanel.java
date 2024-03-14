package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

public class PlayerRoleCheckPanel
				extends JPanel
{
	private int role = 0;

	public PlayerRoleCheckPanel(JLabel controlLabel)
	{
		MigLayout migLayout;

		JCheckBox checkBox;

		migLayout = new MigLayout(
						null,
						GuiConfiguration.FOUR_CELL_SIZE_15P_GAP_8P,
						null
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		checkBox = new JCheckBox(GuiConfiguration.getMessage("goalkeeper"));
		checkBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (ItemEvent.DESELECTED == e.getStateChange()) {
					role -= 1;
				} else if (ItemEvent.SELECTED == e.getStateChange()) {
					role += 1;
				}
				controlLabel.setText(getRoleMix());
			}
		});

		this.add(checkBox);


		checkBox = new JCheckBox(GuiConfiguration.getMessage("defender"));
		checkBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (ItemEvent.DESELECTED == e.getStateChange()) {
					role -= 10;
				} else if (ItemEvent.SELECTED == e.getStateChange()) {
					role += 10;
				}
				controlLabel.setText(getRoleMix());
			}
		});

		this.add(checkBox);


		checkBox = new JCheckBox(GuiConfiguration.getMessage("midfield"));
		checkBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (ItemEvent.DESELECTED == e.getStateChange()) {
					role -= 100;
				} else if (ItemEvent.SELECTED == e.getStateChange()) {
					role += 100;
				}
				controlLabel.setText(getRoleMix());
			}
		});

		this.add(checkBox);


		checkBox = new JCheckBox(GuiConfiguration.getMessage("forwarder"));
		checkBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
				if (ItemEvent.DESELECTED == e.getStateChange()) {
					role -= 1000;
				} else if (ItemEvent.SELECTED == e.getStateChange()) {
					role += 1000;
				}
				controlLabel.setText(getRoleMix());
			}
		});

		this.add(checkBox);

	}


	private String getRoleMix()
	{
		String roleMix = "";
		int toValue = role;


		if (1 == toValue % 10) {
			roleMix += "_GK";
		}

		toValue /= 10;

		if (1 == toValue % 10) {
			roleMix += "_DF";
		}

		toValue /= 10;

		if (1 == toValue % 10) {
			roleMix += "_MF";
		}

		toValue /= 10;

		if (1 == toValue) {
			roleMix += "_FW";
		}

		if (roleMix.isEmpty()) {
			roleMix = null;
		} else {
			roleMix = roleMix.substring(1);
		}

		return roleMix;
	}
}
