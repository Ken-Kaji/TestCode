package com.example.testdrawer003;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;

public class Content1Fragment extends Fragment {
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        // content1.xmlをactivity_main.xmlのcontainerに配置する
        // inflaterは特定の場所に何かを差し込むもの。
        View view = inflater.inflate(R.layout.content1,container,false)
        return view

    }

    public Content1Fragment newContent1Fragment() {
        return new Content1Fragment();
    }
}
