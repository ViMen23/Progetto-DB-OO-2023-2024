package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

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

		String string;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.TWO_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		string = GuiConfiguration.getMessage("noSearch");
		string = string.toUpperCase();
		this.titleLabel = new TitleLabel(string);
		this.add(titleLabel);

		this.textArea = new JTextArea(description);
		textArea.setEditable(false);
		textArea.setBorder(null);

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

		String string;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.TWO_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);

		string = GuiConfiguration.getMessage("noSearch");
		string = string.toUpperCase();
		this.titleLabel = new TitleLabel(string);
		this.add(titleLabel);

		this.textArea = new JTextArea(description);
		textArea.setBorder(BorderFactory.createEmptyBorder(2,20,2,0));
		textArea.setEditable(false);
		textArea.getCaret().deinstall(textArea);
		textArea.setCursor(new Cursor(Cursor.DEFAULT_CURSOR));

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
