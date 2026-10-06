
/**
REF     FECHA         AUTOR               TAREA               RAZON
1      25/Ab/2016    Alejandro Proaño    INT-CC-SGC24730 	  Matriculacion Registro Equipo           

 * Copyright(c) 2004-2010 Entrust Corp.
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of
 * Entrust Corp. ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with Entrust Corp.
 */

/**
 * Class: MachineSecret
 * 
 * Description:  This class can be used to determine the client's
 * machine fingerprint.  It also can determine whether flash
 * cookies should be used (i.e. when browser cookies are not supported
 * and Flash Shockwave 9 or greater is installed) as a persistent
 * storage mechanism and therefore provides the mechanisms to read
 * the associates flash cookie values.
 * 
 * Example Usage:
 *       
 *       var secret = new MachineSecret(true);
 *       var useFlash = secret.getUseFlash();
 *       var machineFingerprint = secret.getMachineFingerprint();
 *       
 *       if (useFlash)
 *       {
 *          flashMachineLabel = secret.getMachineLabel();
 *          flashMacineNonce = secret.getMachineNonce();
 *          flashSequenceNonce = secret.getSequenceNonce();
 *       } 
 */

var dp_attrs = ""; // String to return in a hidden field or cookie
var dp_attr = "";  // Current attribute placeholder
var dp_useVB = false;

function MachineSecret() 
{
   // gather the browser properties which
   // will make up the machine fingerprint
   dp_addAllAttributes();	
   
   this._machineFingerprint = dp_attrs; 
   
}

MachineSecret.prototype._machineFingerprint;

// Return the machine fingerprint defined by the browser properties
MachineSecret.prototype.getMachineFingerprint = function() {
   return this._machineFingerprint;
}

// return a boolean as to whether a given attribute should be excluded (has 0 weight)
function dp_exclude(attrName)
{
   if (!attrName) return true;
   if (dp_exclude[attrName]) return true;
   return false;
}

// add an attribute if not excluded to attrs
function dp_addAttr(attrName, attrValue)
{
   if (!dp_exclude(attrName)) {
      if (dp_attrs != "") dp_attrs += "***";
      dp_attrs += attrName + "=" + attrValue;
   }
}

// Sniff / add all attributes
function dp_addAllAttributes()
{	

	dp_addAttr("screenAvailHeigth", screen.availHeight);
	dp_addAttr("screenColorDepth", screen.colorDepth);
	dp_addAttr("screenHeight", screen.height);
	dp_addAttr("screenWidth", screen.width);
	dp_addAttr("appCodeName", navigator.appCodeName);
	dp_addAttr("appName", navigator.appName);   
	dp_addAttr("appMinorVersion", navigator.appMinorVersion);
	dp_addAttr("cpuClass", navigator.cpuClass);
	dp_addAttr("platform", navigator.platform);
	dp_addAttr("systemLanguage", navigator.systemLanguage);
	dp_addAttr("userLanguage", navigator.userLanguage);
	dp_addAttr("userAgent", navigator.userAgent);
	dp_addAttr("cookieEnabled", navigator.cookieEnabled);
	
}

function Browser() {   
    // ---- public properties -----
    this.fullName = 'unknow'; // getName(false);
    this.name = 'unknow'; // getName(true);
    this.code = 'unknow'; // getCodeName(this.name);
    this.fullVersion = 'unknow'; // getVersion(this.name);
    this.version = 'unknow'; // getBasicVersion(this.fullVersion);
    this.mobile = false; // isMobile(navigator.userAgent);
    this.width = screen.width;
    this.height = screen.height;
    this.platform =  'unknow'; //getPlatform(navigator.userAgent);
    this.cookieEnabled=false;
    this.app='unknow';
    
    //si el un movil
     this.isMobile = 
    {
       mobilecheck : function() 
        {
           return (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino|android|ipad|playbook|silk/i.test(navigator.userAgent||navigator.vendor||window.opera)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test((navigator.userAgent||navigator.vendor||window.opera).substr(0,4)))
        }
    }


    // ------- init -------    
    this.init = function() { //operative system, is an auxiliary var, for special-cases
        //the first var is the string that will be found in userAgent. the Second var is the common name
        // IMPORTANT NOTE: define new navigators BEFORE firefox, chrome and safari
        var navs = [
            { name:'opera mobi', fullName:'Opera Mobile', pre:'version/' },
            { name:'opera mini', fullName:'Opera Mini', pre:'version/' },
            { name:'opera', fullName:'Opera', pre:'version/' },
            { name:'msie', fullName:'Microsoft Internet Explorer', pre:'msie ' },  
            { name:'trident', fullName:'Microsoft Internet Explorer', pre:'rv:' },  
            { name:'iemobile', fullName:'Internet Explorer Mobile', pre:'iemobile:' },  
            { name:'blackberry', fullName:'BlackBerry Navigator', pre:'/' }, 
            { name:'playbook', fullName:'BlackBerry Navigator', pre:'version/' }, 
            { name:'bb10', fullName:'BlackBerry Navigator', pre:'version/' }, 
            { name:'android', fullName:'Apple Safari', pre:'android ' }, 
            { name:'kfapwi', fullName:'Kindle Fire HDX', pre:'silk/' }, 
            { name:'nokia', fullName:'Nokia Navigator', pre:'nokiabrowser/' },
            { name:'browserng', fullName:'Nokia Navigator', pre:'browserng/' }, 
            { name:'midori', fullName:'Midori', pre:'midori/' }, 
            { name:'kazehakase', fullName:'Kazehakase', pre:'kazehakase/' }, 
            { name:'chromium', fullName:'Chromium', pre:'chromium/' }, 
            { name:'flock', fullName:'Flock', pre:'flock/' }, 
            { name:'galeon', fullName:'Galeon', pre:'galeon/' }, 
            { name:'rockmelt', fullName:'RockMelt', pre:'rockmelt/' }, 
            { name:'fennec', fullName:'Fennec', pre:'fennec/' }, 
            { name:'konqueror', fullName:'Konqueror', pre:'konqueror/' }, 
            { name:'arora', fullName:'Arora', pre:'arora/' }, 
            { name:'swiftfox', fullName:'Swiftfox', pre:'firefox/' }, 
            { name:'maxthon', fullName:'Maxthon', pre:'maxthon/' },
            { name:'firefox',fullName:'Mozilla Firefox', pre:'firefox/' },
            { name:'chrome', fullName:'Google Chrome', pre:'chrome/' },
            { name:'safari', fullName:'Apple Safari', pre:'version/' },
            { name:'silk-accelerated', fullName:'AmazonbrowserforKindleFire', pre:'silk/' }
            
        ];
    
        var agent = navigator.userAgent.toLowerCase(), pre;
        this.cookieEnabled=navigator.cookieEnabled;
        this.app=agent;
        //set names
        for (i in navs) {
           if (agent.indexOf(navs[i].name)>-1) {
               pre = navs[i].pre;
               this.name = navs[i].name.toLowerCase(); //the code name is always lowercase
               this.fullName = navs[i].fullName; 
                if (this.name=='msie') this.name = 'iexplorer';
                if (this.name=='opera mobi') this.name = 'opera';
                if (this.name=='opera mini') this.name = 'opera';
                break; //when found it, stops reading
            }
        }//for
        
      //set version
        if ((idx=agent.indexOf(pre))>-1) {
            this.fullVersion = '';
            this.version = '';
            var nDots = 0;
            var len = agent.length;
            var indexVersion = idx + pre.length;
            for (j=indexVersion; j<len; j++) {
                var n = agent.charCodeAt(j); 
                if ((n>=48 && n<=57) || n==46) { //looking for numbers and dots
                    if (n==46) nDots++;
                    if (nDots<2) this.version += agent.charAt(j);
                    this.fullVersion += agent.charAt(j);
                }else j=len; //finish sub-cycle
            }//for
            this.version = parseInt(this.version);
        }
        
        // set Mobile
        var mobiles = ['mobi', 'mobile', 'mini', 'iphone', 'ipod', 'ipad', 'android', 'blackberry'];
        for (var i in mobiles) {
            if (agent.indexOf(mobiles[i])>-1) this.mobile = true;
        }
        if (this.width<700 || this.height<600) this.mobile = true;
        
        // set Platform        
        var plat = navigator.platform;
            if (plat=='win32' || plat=='win64') this.platform = 'Windows';
            if (agent.indexOf('googletv') !=-1) this.platform = 'GoogleTV';
            if (agent.indexOf('windows phone os 7') !=-1) this.platform = 'WinPhone7';
            if (agent.indexOf('windows phone 8') !=-1) this.platform = 'WinPhone8';
            if (agent.indexOf('windows phone 10') !=-1) this.platform = 'WinPhone10';
            if (agent.indexOf('windows ce') !=-1) this.platform = 'WinMob';
            if (agent.indexOf('wm5pie') !=-1) this.platform ='AnoldWindowsMobile';
            if (agent.indexOf('blackberry95') !=-1) this.platform ='BBStorm';
            if (agent.indexOf('blackberry97') !=-1) this.platform ='BBBold';
            if (agent.indexOf('blackberry99') !=-1) this.platform ='BBBoldTouch';
            if (agent.indexOf('blackberry96') !=-1) this.platform ='BBTour';
            if (agent.indexOf('blackberry89') !=-1) this.platform ='BBCurve';
            if (agent.indexOf('blackberry938') !=-1) this.platform ='CurveTouch9380';
            if (agent.indexOf('blackberry98') !=-1) this.platform ='BBTorch';
            if (agent.indexOf('playbook') !=-1) this.platform ='PlayBooktablet';
            if (agent.indexOf('series90') !=-1 || agent.indexOf('series80') !=-1 || agent.indexOf('symbian') !=-1 || agent.indexOf('symbos') !=-1  || agent.indexOf('series60') !=-1 || agent.indexOf('series70') !=-1) this.platform ='Symbian';
            if (agent.indexOf('palm') !=-1) this.platform ='Palm';
            if (agent.indexOf('webos') !=-1) this.platform ='WebOS';
            if (agent.indexOf('web0s') !=-1) this.platform ='WebOStv';
            if (agent.indexOf('hpwos') !=-1) this.platform ='ForHPslineofWebOSdevices';
            if (agent.indexOf('nuvifone') !=-1) this.platform ='GarminNuvifone';
            if (agent.indexOf('bada') !=-1) this.platform ='SamsungsBadaOS';
            if (agent.indexOf('tizen') !=-1) this.platform ='TizenOS';
            if (agent.indexOf('meego') !=-1) this.platform ='MeegoOS';
            if (agent.indexOf('sailfish') !=-1) this.platform ='SailfishOS';
            if (agent.indexOf('ubuntu') !=-1) this.platform ='UbuntuMobileOS';
            if (agent.indexOf('blazer') !=-1) this.platform ='OldPalmbrowser';
            if (agent.indexOf('playstation') !=-1) this.platform ='Playstation';
            if (agent.indexOf('vita') !=-1) this.platform ='PlaystationVita';
            if (agent.indexOf('nitro') !=-1) this.platform ='NintendoDs';
            if (agent.indexOf('nintendo') !=-1) this.platform ='Nintendo';
            if (agent.indexOf('wii') !=-1) this.platform ='Wii';
            if (agent.indexOf('xbox') !=-1) this.platform ='Xbox';
            if (agent.indexOf('archos') !=-1) this.platform ='Archos';
            if (agent.indexOf('smart-tv') !=-1) this.platform ='SamsungTizensmartTVs';
            if (agent.indexOf('smarttv') !=-1) this.platform ='LGWebOSsmartTVs';
            if (agent.indexOf('sonyericsson') !=-1) this.platform ='SonyEricsson';
            if (agent.indexOf('ericsson') !=-1) this.platform ='Ericsson';
            if (agent.indexOf('sony') !=-1) this.platform ='Sony';
            if (agent.indexOf('htc') !=-1) this.platform ='Htc';
            if (agent.indexOf('docomo') !=-1) this.platform ='svcDocomo';
            if (agent.indexOf('kddi') !=-1) this.platform ='svcKddi';
            if (agent.indexOf('vodafone') !=-1) this.platform ='Vodafone';
            if (agent.indexOf('nexus') !=-1) this.platform ='Nexus';
            if (agent.indexOf('4.90') !=-1) this.platform = 'Windows ME';        
            if (agent.indexOf('nt 5.0') !=-1) this.platform = 'Windows 2000';        
            if (agent.indexOf('nt 5.1') !=-1) this.platform = 'Windows XP';        
            if (agent.indexOf('nt 5.2') !=-1) this.platform = 'Windows XP P x64';        
            if (agent.indexOf('nt 6.0') !=-1)  this.platform = 'Windows Vista';
            if (agent.indexOf('nt 6.1') !=-1) this.platform = 'Windows 7';
            if (agent.indexOf('nt 6.2') !=-1) this.platform = 'Windows 8';
            if (agent.indexOf('nt 6.3') !=-1) this.platform = 'Windows 8.1';
            if (agent.indexOf('nt 10.0') !=-1) this.platform = 'Windows 10';
            if (agent.indexOf('mac') !=-1) this.platform = 'Macintosh';
            if (agent.indexOf('linux') !=-1) this.platform = 'Linux';
            if (agent.indexOf('iphone') !=-1) this.platform = 'iOS iPhone';
            if (agent.indexOf('ipod') !=-1) this.platform = 'iOS iPod';
            if (agent.indexOf('ipad') !=-1) this.platform = 'iOS iPad';
            if (agent.indexOf('android') !=-1) this.platform = 'Android';
            if (agent.indexOf('rim') !=-1 || agent.indexOf('bb10') !=-1) this.platform = 'RIM';
            if (agent.indexOf('x11') !=-1) this.platform = 'Unix';
            
        
        if (this.name!='unknow') {
            this.code = this.name+'';
            if (this.name=='opera') this.code = 'op';
            if (this.name=='firefox') this.code = 'ff';
            if (this.name=='chrome') this.code = 'ch';
            if (this.name=='safari') this.code = 'sf';
            if (this.name=='iexplorer') this.code = 'ie';
            if (this.name=='maxthon') this.code = 'mx';
        }
        
        //manual filter, when is so hard to define the navigator type
        if (this.name=='safari' && this.platform=='Linux') {
            this.name = 'unknow';
            this.fullName = 'unknow';
            this.code = 'unknow';
        }
        
    };//function
    
    this.init();
}//Browser class


function setMachineInfo(idAppdatos,idNavegador){
	var secret = new MachineSecret(); 
	var bufferAppDatos = secret.getMachineFingerprint();
	var brw = new Browser(); //ref 7 
	var bufferNavegador='Nav:' + brw.fullName + '-Name:' + brw.name + '-FV:' + brw.fullVersion + '-P:' + brw.platform +'-M:' + brw.isMobile.mobilecheck()+ '-cookie:' + brw.cookieEnabled;
	$k('#'+idAppdatos).val(bufferAppDatos);
	$k('#'+idNavegador).val(bufferNavegador);
}