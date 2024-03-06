package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;

public class AdminChooseSearchTeam
				extends JPanel
{
	public AdminChooseSearchTeam()
	{
		MigLayout migLayout;
		JTabbedPane searchTeam;


		migLayout = new MigLayout(
						"",
						"[grow, fill]",
						""
		);

		this.setLayout(migLayout);
		this.setOpaque(false);

		searchTeam = new JTabbedPane(JTabbedPane.TOP);
		searchTeam.addTab("RicercaTeam", new AdminSearchTeam());
		searchTeam.addTab("FiltraTeam", new StepFilterPanel());

		this.add(searchTeam);
	}
}
