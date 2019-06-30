import UIKit

fileprivate var __appDeviceSizeModel: UIDevice.DeviceSizeModel?
extension UIDevice {
    public enum DeviceSizeModel {
        case unknown
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        /// Different scale @2x vs @3x
        case iPhoneXRandXSMax
    }

    public static var phoneDeviceSize: DeviceSizeModel {
        if let appDeviceSizeModel = __appDeviceSizeModel {
            return appDeviceSizeModel
        }

        // https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions
        switch Int(max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        case 480: __appDeviceSizeModel = .iPhone4
        case 568: __appDeviceSizeModel = .iPhone5
        case 667: __appDeviceSizeModel = .iPhone6
        case 736: __appDeviceSizeModel = .iPhone6Plus
        case 812: __appDeviceSizeModel = .iPhoneX
        case 896: __appDeviceSizeModel = .iPhoneXRandXSMax
        default: __appDeviceSizeModel = .unknown
        }

        return __appDeviceSizeModel!
    }
}

extension UIDevice {
    public enum Model: String {
        case unknown

        case iPhone_Simulator
        case iPhone
        case iPhone_3G
        case iPhone_3GS
        case iPhone_4
        case iPhone_4_GSM_Rev_A
        case iPhone_4_CDMA
        case iPhone_4S
        case iPhone_5_GSM
        case iPhone_5_GSM_CDMA
        case iPhone_5C_GSM
        case iPhone_5C_Global
        case iPhone_5S_GSM
        case iPhone_5S_Global
        case iPhone_6_Plus
        case iPhone_6
        case iPhone_6s
        case iPhone_6s_Plus
        case iPhone_SE_GSM_CDMA
        case iPhone_SE_GSM
        case iPhone_7
        case iPhone_7_Plus
        case iPhone_8
        case iPhone_8_Plus
        case iPhone_X_Global
        case iPhone_X_GSM
        case iPhone_XS
        case iPhone_XS_Max
        case iPhone_XS_Max_Global
        case iPhone_XR

        case iPod_1
        case iPod_2
        case iPod_3
        case iPod_4
        case iPod_5
        case iPod_6

        case iPad
        case iPad_3G
        case iPad_2
        case iPad_2_GSM
        case iPad_2_CDMA
        case iPad_2_New_Revision
        case iPad_3
        case iPad_3_CDMA
        case iPad_3_GSM
        case iPad_mini
        case iPad_mini_GSM_LTE
        case iPad_mini_CDMA_LTE
        case iPad_4
        case iPad_4_GSM_LTE
        case iPad_4_CDMA_LTE
        case iPad_Air_WiFi
        case iPad_Air_GSM_CDMA
        case iPad_Air_China
        case iPad_mini_Retina_WiFi
        case iPad_mini_Retina_GSM_CDMA
        case iPad_mini_Retina_China
        case iPad_mini_3_WiFi
        case iPad_mini_3_GSM_CDMA
        case iPad_Mini_3_China
        case iPad_mini_4_WiFi
        case iPad_mini_4_WiFi_Cellular
        case iPad_Air_2_WiFi
        case iPad_Air_2_Cellular
        case iPad_Pro_9_7_inch_WiFi
        case iPad_Pro_9_7_inch_WiFi_LTE
        case iPad_Pro_12_9_inch_WiFi
        case iPad_Pro_12_9_inch_WiFi_LTE
        case iPad_2017
        case iPad_Pro_2nd_Gen_WiFi
        case iPad_Pro_2nd_Gen_WiFi_Cellular
        case iPad_Pro_10_5_inch
        case iPad_6th_Gen_WiFi
        case iPad_6th_Gen_WiFi_Cellular
        case iPad_Pro_3rd_Gen_11_inch_WiFi
        case iPad_Pro_3rd_Gen_11_inch_1TB_WiFi
        case iPad_Pro_3rd_Gen_11_inch_WiFi_Cellular
        case iPad_Pro_3rd_Gen_11_inch_1TB_WiFi_Cellular
        case iPad_Pro_3rd_Gen_12_9_inch_WiFi
        case iPad_Pro_3rd_Gen_12_9_inch_1TB_WiFi
        case iPad_Pro_3rd_Gen_12_9_inch_WiFi_Cellular
        case iPad_Pro_3rd_Gen_12_9_inch_1TB_WiFi_Cellular

        case Apple_Watch_38mm_case
        case Apple_Watch_Series_1_38mm_case
        case Apple_Watch_Series_1_42mm_case
        case Apple_Watch_Series_2_38mm_case
        case Apple_Watch_Series_2_42mm_case
        case Apple_Watch_Series_3_38mm_case_GPS_Cellular
        case Apple_Watch_Series_3_42mm_case_GPS_Cellular
        case Apple_Watch_Series_3_38mm_case_GPS
        case Apple_Watch_Series_3_42mm_case_GPS
        case Apple_Watch_Series_4_40mm_case_GPS
        case Apple_Watch_Series_4_44mm_case_GPS
        case Apple_Watch_Series_4_40mm_case_GPS_Cellular
        case Apple_Watch_Series_4_44mm_case_GPS_Cellular
    }

    private static var deviceModelCode: String {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafeMutablePointer(to: &systemInfo.machine) { ptr in
            String(cString: UnsafeRawPointer(ptr).assumingMemoryBound(to: CChar.self))
        }
    }

    public static var currentModel: Model {
        switch UIDevice.deviceModelCode {
        case "i386", "x86_64": return .iPhone_Simulator

        case "iPhone1,1": return .iPhone
        case "iPhone1,2": return .iPhone_3G
        case "iPhone2,1": return .iPhone_3GS
        case "iPhone3,1": return .iPhone_4
        case "iPhone3,2": return .iPhone_4_GSM_Rev_A
        case "iPhone3,3": return .iPhone_4_CDMA
        case "iPhone4,1": return .iPhone_4S
        case "iPhone5,1": return .iPhone_5_GSM
        case "iPhone5,2": return .iPhone_5_GSM_CDMA
        case "iPhone5,3": return .iPhone_5C_GSM
        case "iPhone5,4": return .iPhone_5C_Global
        case "iPhone6,1": return .iPhone_5S_GSM
        case "iPhone6,2": return .iPhone_5S_Global
        case "iPhone7,1": return .iPhone_6_Plus
        case "iPhone7,2": return .iPhone_6
        case "iPhone8,1": return .iPhone_6s
        case "iPhone8,2": return .iPhone_6s_Plus
        case "iPhone8,3": return .iPhone_SE_GSM_CDMA
        case "iPhone8,4": return .iPhone_SE_GSM
        case "iPhone9,1": return .iPhone_7
        case "iPhone9,2": return .iPhone_7_Plus
        case "iPhone9,3": return .iPhone_7
        case "iPhone9,4": return .iPhone_7_Plus
        case "iPhone10,1": return .iPhone_8
        case "iPhone10,2": return .iPhone_8_Plus
        case "iPhone10,3": return .iPhone_X_Global
        case "iPhone10,4": return .iPhone_8
        case "iPhone10,5": return .iPhone_8_Plus
        case "iPhone10,6": return .iPhone_X_GSM
        case "iPhone11,2": return .iPhone_XS
        case "iPhone11,4": return .iPhone_XS_Max
        case "iPhone11,6": return .iPhone_XS_Max_Global
        case "iPhone11,8": return .iPhone_XR

        case "iPod1,1": return .iPod_1
        case "iPod2,1": return .iPod_2
        case "iPod3,1": return .iPod_3
        case "iPod4,1": return .iPod_4
        case "iPod5,1": return .iPod_5
        case "iPod7,1": return .iPod_6

        case "iPad1,1": return .iPad
        case "iPad1,2": return .iPad_3G
        case "iPad2,1": return .iPad_2
        case "iPad2,2": return .iPad_2_GSM
        case "iPad2,3": return .iPad_2_CDMA
        case "iPad2,4": return .iPad_2_New_Revision
        case "iPad3,1": return .iPad_3
        case "iPad3,2": return .iPad_3_CDMA
        case "iPad3,3": return .iPad_3_GSM
        case "iPad2,5": return .iPad_mini
        case "iPad2,6": return .iPad_mini_GSM_LTE
        case "iPad2,7": return .iPad_mini_CDMA_LTE
        case "iPad3,4": return .iPad_4
        case "iPad3,5": return .iPad_4_GSM_LTE
        case "iPad3,6": return .iPad_4_CDMA_LTE
        case "iPad4,1": return .iPad_Air_WiFi
        case "iPad4,2": return .iPad_Air_GSM_CDMA
        case "iPad4,3": return .iPad_Air_China
        case "iPad4,4": return .iPad_mini_Retina_WiFi
        case "iPad4,5": return .iPad_mini_Retina_GSM_CDMA
        case "iPad4,6": return .iPad_mini_Retina_China
        case "iPad4,7": return .iPad_mini_3_WiFi
        case "iPad4,8": return .iPad_mini_3_GSM_CDMA
        case "iPad4,9": return .iPad_Mini_3_China
        case "iPad5,1": return .iPad_mini_4_WiFi
        case "iPad5,2": return .iPad_mini_4_WiFi_Cellular
        case "iPad5,3": return .iPad_Air_2_WiFi
        case "iPad5,4": return .iPad_Air_2_Cellular
        case "iPad6,3": return .iPad_Pro_9_7_inch_WiFi
        case "iPad6,4": return .iPad_Pro_9_7_inch_WiFi_LTE
        case "iPad6,7": return .iPad_Pro_12_9_inch_WiFi
        case "iPad6,8": return .iPad_Pro_12_9_inch_WiFi_LTE
        case "iPad6,11": return .iPad_2017
        case "iPad6,12": return .iPad_2017
        case "iPad7,1": return .iPad_Pro_2nd_Gen_WiFi
        case "iPad7,2": return .iPad_Pro_2nd_Gen_WiFi_Cellular
        case "iPad7,3": return .iPad_Pro_10_5_inch
        case "iPad7,4": return .iPad_Pro_10_5_inch
        case "iPad7,5": return .iPad_6th_Gen_WiFi
        case "iPad7,6": return .iPad_6th_Gen_WiFi_Cellular
        case "iPad8,1": return .iPad_Pro_3rd_Gen_11_inch_WiFi
        case "iPad8,2": return .iPad_Pro_3rd_Gen_11_inch_1TB_WiFi
        case "iPad8,3": return .iPad_Pro_3rd_Gen_11_inch_WiFi_Cellular
        case "iPad8,4": return .iPad_Pro_3rd_Gen_11_inch_1TB_WiFi_Cellular
        case "iPad8,5": return .iPad_Pro_3rd_Gen_12_9_inch_WiFi
        case "iPad8,6": return .iPad_Pro_3rd_Gen_12_9_inch_1TB_WiFi
        case "iPad8,7": return .iPad_Pro_3rd_Gen_12_9_inch_WiFi_Cellular
        case "iPad8,8": return .iPad_Pro_3rd_Gen_12_9_inch_1TB_WiFi_Cellular

        case "Watch1,1": return .Apple_Watch_38mm_case
        case "Watch1,2": return .Apple_Watch_38mm_case
        case "Watch2,6": return .Apple_Watch_Series_1_38mm_case
        case "Watch2,7": return .Apple_Watch_Series_1_42mm_case
        case "Watch2,3": return .Apple_Watch_Series_2_38mm_case
        case "Watch2,4": return .Apple_Watch_Series_2_42mm_case
        case "Watch3,1": return .Apple_Watch_Series_3_38mm_case_GPS_Cellular
        case "Watch3,2": return .Apple_Watch_Series_3_42mm_case_GPS_Cellular
        case "Watch3,3": return .Apple_Watch_Series_3_38mm_case_GPS
        case "Watch3,4": return .Apple_Watch_Series_3_42mm_case_GPS
        case "Watch4,1": return .Apple_Watch_Series_4_40mm_case_GPS
        case "Watch4,2": return .Apple_Watch_Series_4_44mm_case_GPS
        case "Watch4,3": return .Apple_Watch_Series_4_40mm_case_GPS_Cellular
        case "Watch4,4": return .Apple_Watch_Series_4_44mm_case_GPS_Cellular

        default: return .unknown
        }
    }
}



























