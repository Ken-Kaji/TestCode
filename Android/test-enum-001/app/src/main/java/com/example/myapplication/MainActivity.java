
package com.example.myapplication;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class MainActivity extends AppCompatActivity {
    private final Boolean saveTest = true;
    private final Boolean loadTest = false;
    private final String TEST_FILE = "test.bin";
    private final String TAG = "MainActivity";

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d(TAG, "<onCreate>");
        setContentView(R.layout.activity_main);
        if (saveTest) {
            try {
                String filename = getApplicationContext().getExternalFilesDir(TEST_FILE).toString();
                Log.d(TAG, "filename="+filename);
                ObjectOutputStream objOutStream =
                        new ObjectOutputStream(
                                new FileOutputStream(filename));
                Log.d(TAG, "foo");
                DesignObject object = new DesignObject();
                Log.d(TAG, "boo");

                objOutStream.writeObject(object);
                Log.d(TAG, "woo");

                objOutStream.close();

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (loadTest) {
            try {
                ObjectInputStream objInStream
                        = new ObjectInputStream(
                        new FileInputStream(getApplicationContext().getFileStreamPath(TEST_FILE)));

                DesignObject company = (DesignObject) objInStream.readObject();

                objInStream.close();

                // 結果を出力

            } catch (IOException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        Log.d("MainActivity", "</onCreate>");
    }
}