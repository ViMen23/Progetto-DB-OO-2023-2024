package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.Vector;

public class TablePanel
				extends JPanel
{
	private final TitleLabel titleLabel;
	private final JTextArea textArea;
	private final MyTable myTable;

	public TablePanel(Boolean sort,
										String description,
										JLabel controlColumnLabel,
										JLabel controlRowLabel,
										JLabel controlMouseLabel)
	{
		MigLayout migLayout;
		JScrollPane scrollPane;

		migLayout = new MigLayout(
						GuiConfiguration.tablePanelLayoutConstraint,
						GuiConfiguration.tablePanelColumnConstraint,
						GuiConfiguration.tablePanelRowConstraint + "[]10"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		this.titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgNoSearch"));
		this.add(titleLabel);

		this.textArea = new JTextArea(description);
		textArea.setEditable(false);
		textArea.setBorder(null);
		textArea.setFont(GuiConfiguration.getOutputFont());

		this.add(textArea);

		scrollPane = new JScrollPane();
		this.add(scrollPane);

		this.myTable = new MyTable(sort, controlColumnLabel, controlRowLabel, controlMouseLabel);
		scrollPane.setViewportView(myTable);
	}

	public TablePanel(Boolean sort,
										String description)
	{
		MigLayout migLayout;
		JScrollPane scrollPane;

		migLayout = new MigLayout(
						GuiConfiguration.tablePanelLayoutConstraint,
						GuiConfiguration.tablePanelColumnConstraint,
						GuiConfiguration.tablePanelRowConstraint + "[]10"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		this.titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgNoSearch"));
		this.add(titleLabel);

		this.textArea = new JTextArea(description);
		textArea.setEditable(false);
		textArea.setBorder(null);
		textArea.setFont(GuiConfiguration.getOutputFont());

		this.add(textArea);

		scrollPane = new JScrollPane();
		this.add(scrollPane);

		this.myTable = new MyTable(sort);
		scrollPane.setViewportView(myTable);
	}

	public MyTable getMyTable()
	{
		return myTable;
	}

	public JTextArea getTextArea()
	{
		return textArea;
	}

	public TitleLabel getTitleLabel()
	{
		return titleLabel;
	}
}
