package com.exam.util;


import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.exam.vo.CloudStorageConfigVo;
import com.exam.vo.base.ResponseVo;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;

public class QCloudUtil {
	
	public static ResponseVo writeFile(CloudStorageConfigVo cloudStorageConfig, String filePath, MultipartFile file) {
		String accessKey = cloudStorageConfig.getQcloudSecretId();
		String secretKey = cloudStorageConfig.getQcloudSecretKey();
		String bucket =  cloudStorageConfig.getQcloudRegion();
		// bucket的命名规则为{name}-{appid} ，此处填写的存储桶名称必须为此格式
        String bucketName = cloudStorageConfig.getQcloudBucketName();
		// 1 初始化用户身份信息(secretId, secretKey)
        COSCredentials cred = new BasicCOSCredentials(accessKey, secretKey);
        // 2 设置bucket的区域, COS地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
        ClientConfig clientConfig = new ClientConfig(new Region(bucket));
        // 3 生成cos客户端
        COSClient cosclient = new COSClient(cred, clientConfig);
        // 简单文件上传, 最大支持 5 GB, 适用于小文件上传, 建议 20 M 以下的文件使用该接口
        // 大文件上传请参照 API 文档高级 API 上传
        File localFile = null;
        try {
        	localFile = File.createTempFile("temp",null);
            file.transferTo(localFile);
            // 指定要上传到 COS 上的路径
            String key = filePath;
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
            PutObjectResult putObjectResult = cosclient.putObject(putObjectRequest);
            return new ResponseVo(CoreConst.SUCCESS_CODE,"上传成功");
		} catch (IOException e) {
			return new ResponseVo(CoreConst.FAIL_CODE,e.getMessage());
		}finally {
			// 关闭客户端(关闭后台线程)
            cosclient.shutdown();
		}
	}

}
