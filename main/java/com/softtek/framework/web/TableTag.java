package com.softtek.framework.web;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;



// TODO: Auto-generated Javadoc
/**
 * TableTag.
 *
 * @author Juan Irungaray
 */

public class TableTag extends BodyTagSupport {

	
	/** The nombre tabla. */
	private String nameTable;
	/** The nombre valores columna. */
	private String nameValueColumns;
	/** The name columns. */
	private String nameColumns;
	/** The json valores. */
	private String jsonObject;
	
	/** The check box. */
	private boolean checkBox;
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.TagSupport#doStartTag()
	 */
	@Override
	public int doStartTag() throws JspException {
			JspWriter out = pageContext.getOut();
			TableBuilder tableBuilder = new TableBuilder();
			nameValueColumns = StringUtils.isEmpty(nameValueColumns) ? " " : nameValueColumns;
			List<String> listNameValues = Arrays.asList(StringUtils.split(nameValueColumns, ","));
			List<String> listNameColumns = Arrays.asList(StringUtils.split(nameColumns, ","));
			jsonObject = StringUtils.isEmpty(jsonObject) ? "[]" : jsonObject;
			String table = tableBuilder.buildTableHTML(JSONArray.fromObject(jsonObject), listNameValues, listNameColumns, nameTable,checkBox);
			try {
				out.println(table);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return SKIP_BODY;
		
	}
	

	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
	 */
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	


	/**
	 * Gets the nombre tabla.
	 *
	 * @return the nombre tabla
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String getNameTable() {
		return nameTable;
	}

	/**
	 * Sets the nombre tabla.
	 *
	 * @param nombreTabla the new name table
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public void setNameTable(String nombreTabla) {
		this.nameTable = nombreTabla;
	}

	/**
	 * Gets the nombre valores columna.
	 *
	 * @return the nombre valores columna
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String getNameValueColumns() {
		return nameValueColumns;
	}

	/**
	 * Sets the nombre valores columna.
	 *
	 * @param nombreValoresColumna the new name value columns
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public void setNameValueColumns(String nombreValoresColumna) {
		this.nameValueColumns = nombreValoresColumna;
	}

	/**
	 * Gets the json valores.
	 *
	 * @return the json valores
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public String getJsonObject() {
		return jsonObject;
	}

	/**
	 * Sets the json valores.
	 *
	 * @param jsonValores the new json valores columnas
	 * @since 04-nov-2010
	 * @author cfigueroa
	 */
	public void setJsonObject(String jsonValores) {
		this.jsonObject = jsonValores;
	}
	
	/**
	 * Gets the name columns.
	 *
	 * @return the name columns
	 * @since 05-nov-2010
	 * @author cfigueroa
	 */
	public String getNameColumns() {
		return nameColumns;
	}


	/**
	 * Sets the name columns.
	 *
	 * @param nombresColumnas the new name columns
	 * @since 05-nov-2010
	 * @author cfigueroa
	 */
	public void setNameColumns(String nombresColumnas) {
		this.nameColumns = nombresColumnas;
	}



	/**
	 * Checks if is check box.
	 *
	 * @return true, if is check box
	 * @since 12-nov-2010
	 * @author cfigueroa
	 */
	public boolean isCheckBox() {
		return checkBox;
	}



	/**
	 * Sets the check box.
	 *
	 * @param checkBox the new check box
	 * @since 12-nov-2010
	 * @author cfigueroa
	 */
	public void setCheckBox(boolean checkBox) {
		this.checkBox = checkBox;
	}

	
	
	
}
