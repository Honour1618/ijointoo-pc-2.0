/*
 * 公用的表单验证
 */

/**
 * 验证手机号
 * @param s
 * @returns {Boolean}
 */
function isMobile(s){
	//电信号段:133/153/180/181/189/177；
	//联通号段:130/131/132/155/156/185/186/145/176/175/166；
	//移动号段：134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
	var patrn= /^(13[0-9]|14[579]|15[0-9]|16[6]|17[135678]|18[0123456789])\d{8}$/ ;
	if (!patrn.test(s))
		return false;
	return true;
}

/**
 * 是否是中文名
 * @param val
 * @returns
 */
function isChName(val){
	var patrn = /^[\u4E00-\u9FA5]{2,20}$/;	
	if(!patrn.test(val))
		return false;
	else
		return true ;
}

/**
 * 是否是合理昵称
 * @param val
 * @returns
 */
function isNickName(val){
	var patrn = /^[\u4E00-\u9FA5A-Za-z0-9_]{2,20}$/;	
	if(!patrn.test(val))
		return false;
	else
		return true ;
}

/** 
 * 是否是数字
 * @param val
 * @returns
 */
function isNumber(val){
	var patrn = /^[0-9]*$/;
	if(!patrn.test(val))
		return false;
	else
		return true;
}