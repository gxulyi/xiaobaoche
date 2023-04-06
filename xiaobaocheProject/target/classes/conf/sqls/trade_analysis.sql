/* analysis_super_start_end.data */
SELECT (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND in_date >= @start_in_date AND in_date <= @end_in_date) s_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '1' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv1_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '2' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv2_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '3' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv3_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '4' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv4_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_norm_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '0' AND in_date > @start_in_date AND in_date <= @end_in_date) s_del_order_nums
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND in_date > @start_in_date AND in_date <= @end_in_date) s_all_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '1' AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_rsv1_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '2' AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_rsv2_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '3' AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_rsv3_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_norm_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '0' AND in_date > @start_in_date AND in_date <= @end_in_date) s_del_sum
, t.*, tm.area_attr FROM ti_member t LEFT JOIN ti_company tm ON tm.cust_id = t.cust_id where t.state_code = 'c' AND t.user_class IN ('1', '2', '7', '8', 's') AND tm.area_attr IS NOT NULL;
/* analysis_sub_super_start_end.data */
SELECT (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND in_date >= @start_in_date AND in_date <= @end_in_date) s_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '1' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv1_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '2' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv2_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '3' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv3_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '4' AND state_code = '1' AND in_date >= @start_in_date AND in_date <= @end_in_date) s_rsv4_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_norm_order_nums
, (SELECT COUNT(*) FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '0' AND in_date > @start_in_date AND in_date <= @end_in_date) s_del_order_nums
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND in_date > @start_in_date AND in_date <= @end_in_date) s_all_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '1' AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_rsv1_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '2' AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_rsv2_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND rsrv_str1 = '3' AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_rsv3_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '1' AND in_date > @start_in_date AND in_date <= @end_in_date) s_norm_sum
, (SELECT SUM(real_price) sum_all_total FROM ti_inquiry WHERE s_cust_id = t.cust_id AND state_code = '0' AND in_date > @start_in_date AND in_date <= @end_in_date) s_del_sum
, t.*, tm.area_attr FROM ti_member t LEFT JOIN ti_company tm ON tm.cust_id = t.cust_id where t.state_code = 'c' AND t.user_class IN ('1', '2', '7', '8', 's') AND tm.area_attr IS NOT NULL;