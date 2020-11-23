package com.example.testdrawer003;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import java.lang.reflect.Array;

import androidx.fragment.app.Fragment;

public class ListFragment extends Fragment {
    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        // list.xmlをListFragmentに持ってくる
        View listframe = inflater.inflate(R.layout.list,container,false)

        // アイテム一覧を表示するListView（list.xmlのidがcontentListのListView）を指定
        ListView listView = listframe.findViewById(R.id.contentList);

        // アイテム一覧に表示するアイテム。
        Array items = new Array("コンテンツ１","コンテンツ２");

        // アダプター
        val adapter = ArrayAdapter<String>(this.context,R.layout.list_content_row,R.id.contentName,items)

        // アダプターを使ってListviewにアイテムを表示
        listView.adapter = adapter;

        // リストの中のアイテムが選択されたら、選択されたアイテム名をリスナーに知らせる
        listView.setOnItemClickListener{parent, view, position, id ->
                val selectedItem = items[position]
            val listner = context as? OnItemClickListner
            listner?.onItemClicked(contentName = selectedItem)
        }
        return listframe
    }

    public ListFragment newListFragment() {
        //インスタンス生成
        return new ListFragment();
    }

    interface OnItemClickListner{
        void onItemClicked(String contentName );
    }

}
