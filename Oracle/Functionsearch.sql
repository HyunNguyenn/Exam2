CREATE OR REPLACE FUNCTION search_customer(
    p_id IN VARCHAR2 DEFAULT NULL,
    p_name IN VARCHAR2 DEFAULT NULL,
    p_phone IN VARCHAR2 DEFAULT NULL
)
RETURN SYS_REFCURSOR
AS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT kh.makh as ID, kh.hoten as Ho_Ten, tk.maso AS saving_book_id, kh.phanloai as Rank, 
               cn.ten_cn AS branch_name, cn.phutrach AS manager_name, t.laisuat AS interest_rate
        FROM khach_hang kh LEFT JOIN tiet_kiem tk ON kh.makh = tk.makh
                            LEFT JOIN chi_nhanh cn ON tk.noi_gui = cn.ma_cn
                            LEFT JOIN ky_han t ON t.ma = tk.kyhan
        WHERE (p_id IS NULL OR kh.makh = p_id)
        AND (p_name IS NULL OR kh.hoten LIKE '%' || p_name || '%')
        AND (p_phone IS NULL OR kh.sodienthoai = p_phone);
    RETURN v_cursor;
END;

DECLARE
    v_result SYS_REFCURSOR;
BEGIN
    v_result := search_customer(p_id => 'KH03', p_name => 'Ngô Trúc Quân', p_phone => '01229022001');
END;