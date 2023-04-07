create or replace PROCEDURE Rut_tien (
                                p_makh in varchar2,
                                p_maso in varchar2,
                                p_sotien out number)
as
    v_sotien number;
    v_ngaygui date;
    v_laisuat number;
    v_kyhan varchar2(20);
    v_songaychuki number;
    v_songayrut number;
begin
    select k.laisuat
    into v_laisuat
    from tiet_kiem tk left join ky_han k on tk.kyhan = k.ma
    where tk.makh = p_makh and tk.maso = p_maso;
    --
    select t.ngaygui, t.kyhan, ADD_MONTHS(t.ngaygui,substr(kyhan,3))-t.ngaygui as songaychuky , trunc(sysdate) - t.ngaygui as songayrut,t.sotien
    into v_ngaygui,v_kyhan,v_songaychuki,v_songayrut,v_sotien
    from tiet_kiem t
    where t.makh = p_makh and t.maso = p_maso;

    if v_songayrut - v_songaychuki < 0 then
            v_sotien := ROUND(v_sotien * (1+0.003/365*v_songayrut));
    elsif v_songayrut - v_songaychuki = 0 then
            v_sotien := ROUND(v_sotien * (1+(v_laisuat/365)*v_songaychuki));
    elsif v_songayrut - v_songaychuki > 0 then
        loop
        exit when v_songayrut - v_songaychuki <0;
            v_sotien := v_sotien * (1+(v_laisuat/365)*v_songaychuki);
            v_songayrut := v_songayrut - v_songaychuki;
        end loop;
            v_sotien := ROUND(v_sotien * (1+0.003/365*v_songayrut));
    end if;
    p_sotien := v_sotien;
end;