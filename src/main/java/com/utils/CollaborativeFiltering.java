package com.utils;

import java.util.*;

public class CollaborativeFiltering {


    // 计算用户之间的相似度
    public static double similarity(int user1, int user2,double[][] ratings) {
        int n = ratings[0].length;
        double sum1 = 0, sum2 = 0, sum3 = 0;
        for (int i = 0; i < n; i++) {
            if (ratings[user1][i] != 0 && ratings[user2][i] != 0) {
                sum1 += ratings[user1][i] * ratings[user2][i];
                sum2 += Math.pow(ratings[user1][i], 2);
                sum3 += Math.pow(ratings[user2][i], 2);
            }
        }
        if (sum2 == 0 || sum3 == 0) {
            return 0;
        } else {
            return sum1 / (Math.sqrt(sum2) * Math.sqrt(sum3));
        }
    }

    // 为指定用户生成推荐结果
    public static List<Integer> recommend(int user, double[][] ratings) {
        Map<Integer, Double> scores = new HashMap<>();
        for (int i = 0; i < ratings.length; i++) {
            if (i != user) {
                double sim = similarity(user, i,ratings);
                if (sim > 0) {
                    for (int j = 0; j < ratings[user].length; j++) {
                        if (ratings[user][j] == 0 && ratings[i][j] != 0) {
                            scores.put(j, scores.getOrDefault(j, 0.0) + ratings[i][j] * sim);
                        }
                    }
                }
            }
        }
        List<Integer> recommendations = new ArrayList<>();
        scores.entrySet().stream()
                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
                .forEach(entry -> recommendations.add(entry.getKey()));
        return recommendations;
    }



    public static void main(String[] args) {
        double[][] ratings = {
                {5, 3, 0, 2},
                {4, 0, 0, 1},
                {1, 1, 0, 5},
                {0, 0, 4, 4},
                {0, 1, 5, 0}
        };

        int user = 0;
        List<Integer> recommendations = recommend(user,ratings);
        System.out.println("推荐给用户" + user + "的物品列表：" + recommendations);
    }
}
