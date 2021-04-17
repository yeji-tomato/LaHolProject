package com.kh.lahol.store.model.vo;

 
 
 
public class storeA {
	private String qnaNo;
	private String aContent;
	private String id;
	
	public storeA() {}
	
	public storeA(String qnaNo, String aContent, String id) {
		super();
		this.qnaNo = qnaNo;
		this.aContent = aContent;
		this.id = id;
	}

	public String getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "storeA [qnaNo=" + qnaNo + ", aContent=" + aContent + ", id=" + id + "]";
	} 
	
	
}
