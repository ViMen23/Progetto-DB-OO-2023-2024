package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.util.Map;
import java.util.Set;

public class AdminGeneralInfo
				extends JPanel {
	public AdminGeneralInfo(Map<String, String> infoTeamMap) {
		MigLayout migLayout;
		JLabel label;

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						"10[grow, fill]40[grow, fill]10",//TODO
						null
						);

		this.setLayout(migLayout);
		this.setBackground(Color.white);
	}
}
