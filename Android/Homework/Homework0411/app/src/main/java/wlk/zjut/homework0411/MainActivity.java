package wlk.zjut.homework0411;

import androidx.appcompat.app.AppCompatActivity;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final EditText id = findViewById(R.id.Number);
        final EditText name = findViewById(R.id.Name);
        final EditText major = findViewById(R.id.Major);
        Button insert = findViewById(R.id.Insert);      //将数据输入到数据库
        Button update = findViewById(R.id.Update);
        Button delete = findViewById(R.id.Delete);
        Button select = findViewById(R.id.Select);
        final TextView show = findViewById(R.id.show);

        final MyDBHelper helper = new MyDBHelper(MainActivity.this);
        final SQLiteDatabase db = helper.getReadableDatabase();

        insert.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String sql = "INSERT INTO " + helper.TABLE_NAME + " VALUES ( " + id.getText().toString() + " , '" + name.getText().toString() + "' , '" + major.getText().toString() + "' )";
                db.execSQL(sql);
            }
        });

        update.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String sql = "UPDATE " + helper.TABLE_NAME + " SET major = " + major.getText().toString() + " WHERE id = " + id.getText().toString();
                db.execSQL(sql);
            }
        });

        delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String sql = "DELETE FROM " + helper.TABLE_NAME + " WHERE id=" + id.getText().toString();
                db.execSQL(sql);
            }
        });

        select.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (!id.getText().toString().equals("")){
                    String sql = "SELECT * FROM " + helper.TABLE_NAME + " WHERE id=" + id.getText().toString();
                    Cursor cursor = db.rawQuery(sql, null);
                    String result;
                    if (cursor.getCount() == 0) {
                        result = "无数据";
                    }
                    else {
                        result = "";
                        while (cursor.moveToNext()) {
                            int dataId = cursor.getInt(0);
                            String dataName = cursor.getString(1);
                            String dataMajor = cursor.getString(2);
                            String temp = "学号：" + dataId + " , " + "姓名：" + dataName + " , " + "专业：" + dataMajor + "\n";
                            result += temp;
                        }
                        show.setText(result);
                    }
                }else {
                    String sql = "SELECT * FROM " + helper.TABLE_NAME;
                    Cursor cursor = db.rawQuery(sql, null);
                    String result;
                    if (cursor.getCount() == 0) {
                        result = "无数据";
                    }
                    else {
                        result = "";
                        while (cursor.moveToNext()) {
                            int dataId = cursor.getInt(0);
                            String dataName = cursor.getString(1);
                            String dataMajor = cursor.getString(2);
                            String temp = "学号：" + dataId + " , " + "姓名：" + dataName + " , " + "专业：" + dataMajor + "\n";
                            result += temp;
                        }
                        show.setText(result);
                    }
                }

            }
        });
    }
}
