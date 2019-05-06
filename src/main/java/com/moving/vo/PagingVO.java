package com.moving.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

public class PagingVO {
	
	private int pageCnt;          // 출력할 페이지번호 갯수
    private int index;            // 출력할 페이지번호
    private int pageStartNum;    // 출력할 페이지 시작 번호
    private int listCnt;          // 출력할 리스트 갯수
    private int total;            // 리스트 총 갯수    
    
    private int start;
    private int last;
    
    {
        pageCnt = 3;
        index = 0;
        pageStartNum = 1;
        listCnt = 10;
    }
    
    public PagingVO() {}
    
    public int getStart() {
        return index*listCnt;
    }
    public int getLast() {
        return (index*listCnt)+listCnt;
    }
    public int getPageLastNum() {
        int remainListCnt = total-listCnt*(pageStartNum-1);
        int remainPageCnt = remainListCnt/listCnt;
        if(remainListCnt%listCnt != 0) {
            remainPageCnt++;
        }
        int pageLastNum = 0;
        if(remainListCnt <= listCnt) {
            pageLastNum = pageStartNum;
        }else if(remainPageCnt <= pageCnt) {
            pageLastNum = remainPageCnt+pageStartNum-1;
        }else {
            pageLastNum = pageCnt+pageStartNum-1;
        }
        return pageLastNum;
    }
    public boolean getLastChk() {
        int n = (int)Math.ceil((double)total/listCnt);
        return getPageLastNum()==n ? false : n==0 ? false : true;
    }
    
    public int getPageCnt() {
        return pageCnt;
    }
    public void setPageCnt(int pageCnt) {
        this.pageCnt = pageCnt;
    }
    public int getIndex() {
        return index;
    }
    public void setIndex(int index) {
        this.index = index;
    }
    public int getPageStartNum() {
        return pageStartNum;
    }
    public void setPageStartNum(int pageStartNum) {
        this.pageStartNum = pageStartNum;
    }
    public int getListCnt() {
        return listCnt;
    }
    public void setListCnt(int listCnt) {
        this.listCnt = listCnt;
    }
    public int getTotal() {
        return total;
    }
    public void setTotal(int total) {
        this.total = total;
    }
    
    @Override
    public String toString() {
        return "PagingDto [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
                + listCnt + ", total=" + total + ", start=" + start + "]";
    }
	
}
