package com.utils;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public class _1Test {


    public static void main(String[] args) {




        System.out.print("Enter directory path: ");
        String directoryPath = "C:\\Users\\Lenovo\\Desktop\\新建文件夹\\模板\\生成\\test";

        String nowDictoryPath = "D:\\workspace\\total\\idea1\\springboot4op8n(2)\\src\\main\\java\\com";
        String nowDaoXmlDictoryPath = "D:\\workspace\\total\\idea1\\springboot4op8n(2)\\src\\main\\resources\\mapper";


        System.out.print("Enter original string: ");
        String originalString = "Fangzhu";

        System.out.print("Enter new string: ");
        String newString = "Zhanneihuodong";

        String zhongwen = "站内活动";











        String strings = newString.substring(0,1).toLowerCase()+newString.substring(1);
        // 指定文件路径
        String filePath = "C:\\Users\\Lenovo\\Desktop\\新建文件夹\\模板\\生成\\"+strings+"+router.vue";

        // 使用静态字符串生成代码
        generateAndSaveJavaCode(strings, zhongwen, filePath);




        _1Test fileModifier = new _1Test(directoryPath, originalString, newString);
        try {
            fileModifier.modifyFileName();
            fileModifier.modifyFileContent();
            System.out.println("Files modified successfully.");
        } catch (IOException e) {
            System.err.println("An error occurred: " + e.getMessage());
        }

        _1Test fileModifier1 = new _1Test(directoryPath,
                originalString.substring(0,1).toLowerCase()+originalString.substring(1),
                newString.substring(0,1).toLowerCase()+newString.substring(1));
        try {
            fileModifier1.modifyFileName();
            fileModifier1.modifyFileContent();
            System.out.println("Files modified successfully.");
        } catch (IOException e) {
            System.err.println("An error occurred: " + e.getMessage());
        }

        String filename = newString+"Controller.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\controller\\"+filename);
        filename = newString+"Dao.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\dao\\"+filename);
        filename = newString+"Entity.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\entity\\"+filename);
        filename = newString+"Model.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\entity\\model\\"+filename);
        filename = newString+"Service.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\service\\"+filename);
        filename = newString+"ServiceImpl.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\service\\impl\\"+filename);
        filename = newString+"View.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\entity\\view\\"+filename);
        filename = newString+"VO.java";
        moveFile(directoryPath+"\\"+filename,nowDictoryPath+"\\entity\\vo\\"+filename);
        filename = newString+"Dao.xml";
        moveFile(directoryPath+"\\"+filename,nowDaoXmlDictoryPath+"\\"+filename);
    }

    private final String directoryPath;
    private final String originalString;
    private final String newString;

    public _1Test(String directoryPath, String originalString, String newString) {
        this.directoryPath = directoryPath;
        this.originalString = originalString;
        this.newString = newString;
    }

    private static void generateAndSaveJavaCode(String placeholder1, String placeholder2, String filePath) {
        // 原始字符串模板
        String originalTemplate = "\n\n\nimport %s from '@/views/modules/%s/list'\n" +
                "{\n" +
                "    path: '/%s',\n" +
                "    name: '%s',\n" +
                "    component: %s\n" +
                "},\n\n\n" +
                "{\n" +
                "    \"child\": [{\n" +
                "        \"appFrontIcon\": \"cuIcon-news\",\n" +
                "        \"buttons\": [\"新增\", \"查看\", \"修改\", \"删除\", \"审核\",\"类型统计\"],\n" +
                "        \"menu\": \"%s\",\n" +
                "        \"menuJump\": \"列表\",\n" +
                "        \"tableName\": \"%s\"\n" +
                "    }], \"menu\": \"%s管理\"\n" +
                "},\n\n\n\n\n " +
                "------------------------前台----------------------------\n"+

                "{\n" +
                "    name: '%s',\n" +
                "    url: '/index/%s'\n" +
                "},\n\n\n" +
                "import %sList from '../pages/%s/list'\n" +
                "import %sDetail from '../pages/%s/detail'\n" +
                "import %sAdd from '../pages/%s/add'\n\n\n" +
                "{\n" +
                "    path: '%s',\n" +
                "    component: %sList\n" +
                "},\n" +
                "{\n" +
                "    path: '%sDetail',\n" +
                "    component: %sDetail\n" +
                "},\n" +
                "{\n" +
                "    path: '%sAdd',\n" +
                "    component: %sAdd\n" +
                "},\n";

        // 使用静态字符串替换占位符
        String generatedCode = String.format(originalTemplate,
                placeholder1, placeholder1, placeholder1, placeholder2, placeholder1,
                placeholder2, placeholder1, placeholder2,
                placeholder2, placeholder1,
                placeholder1, placeholder1, placeholder1,
                placeholder1, placeholder1,
                placeholder1, placeholder1,
                placeholder1, placeholder1,
                placeholder1, placeholder1,
                placeholder1, placeholder1);

        // 将生成的 Java 代码写入文件
        try (FileWriter writer = new FileWriter(filePath)) {
            writer.write("// Generated Java Code\n");
            writer.write(generatedCode);
            System.out.println("Java代码已成功写入文件：" + filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void modifyFileName() throws IOException {
        File directory = new File(directoryPath);
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile() && file.getName().contains(originalString)) {
                    String newFileName = file.getName().replace(originalString, newString);
                    Path sourcePath = file.toPath();
                    Path targetPath = new File(file.getParent(), newFileName).toPath();
                    Files.move(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
                }
            }
        }
    }

    public void modifyFileContent() throws IOException {
        File directory = new File(directoryPath);
        File[] files = directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    String content = new String(Files.readAllBytes(file.toPath()));
                    String newContent = content.replace(originalString, newString);
                    Files.write(file.toPath(), newContent.getBytes());
                }
            }
        }
    }



    public static boolean moveFile(String sourceFilePath, String targetFilePath) {
        try {
            // 创建源文件对象
            File sourceFile = new File(sourceFilePath);

            // 检查源文件是否存在
            if (!sourceFile.exists()) {
                System.out.println("源文件不存在！");
                return false;
            }

            // 创建目标文件对象
            File targetFile = new File(targetFilePath);

            // 判断目标文件所在的目录是否存在，如果不存在则创建
            if (!targetFile.getParentFile().exists()) {
                targetFile.getParentFile().mkdirs();
            }

            // 使用Java NIO的Files工具类进行文件移动操作
            Path sourcePath = sourceFile.toPath();
            Path targetPath = targetFile.toPath();
            Files.copy(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);

            System.out.println("文件移动成功！");
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }



}


